# Para calcular la variación

data_by_variable |> 
  select(periodo, pais, tpm) |> 
  pivot_wider(names_from = pais, values_from = tpm) |> 
  mutate(
    variacion = 
    across(-periodo, \(x){x -lag(x)})
    )
