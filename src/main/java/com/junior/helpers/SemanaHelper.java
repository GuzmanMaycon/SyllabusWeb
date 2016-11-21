package com.junior.helpers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

public class SemanaHelper {

    /**
     *
     * @return Map<Integer, Date> El key es la semana y el value es la fecha de inicio de la semana
     */
    public static Map<Integer, Date> retornarUltimasSemanas(Date fechaInicioPeriodo)
    {
        Map<Integer, Date> semanas = new LinkedHashMap<Integer, Date>();

        Calendar fechaActual = Calendar.getInstance();
        Calendar fechaInicio = Calendar.getInstance();
        fechaInicio.setTime(fechaInicioPeriodo);
        Integer diffDias = (fechaActual.get(Calendar.DAY_OF_YEAR) - fechaInicio.get(Calendar.DAY_OF_YEAR));
        Integer semanaActual = (diffDias / 7) + 1;

        SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
        if (semanaActual > 2) {
            // Obtener fecha de hace dos semanas e iterar hasta la semana actual
            Calendar fecha = Calendar.getInstance();
            fecha.add(Calendar.WEEK_OF_YEAR,-2);
            fecha.set(Calendar.HOUR_OF_DAY, 0); // ! clear would not reset the hour of day !
            fecha.clear(Calendar.MINUTE);
            fecha.clear(Calendar.SECOND);
            fecha.clear(Calendar.MILLISECOND);
            fecha.set(Calendar.DAY_OF_WEEK, fecha.getFirstDayOfWeek());

            for (int i = -2; i <= 0 ; i++) {
                semanas.put(semanaActual + i, fecha.getTime());
                fecha.add(Calendar.WEEK_OF_YEAR, 1);
            }
        } else {
            // Traer todo, 2 o 1 semana
        }

        return semanas;
    }
}
