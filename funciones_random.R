
impuesto_sRenta <- function(sueldo # Sueldo mensual 
){
  
  
  sueldo_anual <- sueldo * 12
  
  impuesto_anual <- dplyr::case_when(
    sueldo_anual <= 416220 ~ sueldo_anual,
    sueldo_anual >= 416220.01 & sueldo_anual <= 624329 ~ (sueldo_anual - 416220.01) * 0.15,
    sueldo_anual >= 624329.01 & sueldo_anual <= 867123 ~ ((sueldo_anual - 624329.01) * 0.20) + 31216,
    sueldo_anual >= 867123.01  ~ ((sueldo_anual-867123.01) * 0.25) + 79776
  )
  
  impuesto_anual
  
}
