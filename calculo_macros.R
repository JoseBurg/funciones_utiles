# Para calcular la variación

data_by_variable |> 
  select(periodo, pais, tpm) |> 
  pivot_wider(names_from = pais, values_from = tpm) |> 
  mutate(
    variacion = 
    across(-periodo, \(x){x -lag(x)})
    )

# Variacion porcentual
data_by_variable |> 
  select(periodo, pais, tpm) |> 
  pivot_wider(names_from = pais, values_from = tpm) |> 
  mutate(
    variacion = 
    across(-periodo, \(x){((x -lag(x))/x)*100})
    )


# Aplicar filtro por columna
df <- data.frame(
  id = c(1, 2, 3, 4, 5, 6),
  x = c(0, 0, 0, 0, 1, 0),
  y = c(0, 0, 0, 1, 2, 0),
  z = c(0, 0, 4, 0, 0, 0)
  )

df |> 
  filter(if_any(-id, \(x){x != 0}))
