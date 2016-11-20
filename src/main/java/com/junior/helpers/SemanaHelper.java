package com.junior.helpers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class SemanaHelper {

    /**
     *
     * @return Map<Integer, Date> El key es la semana y el value es la fecha de inicio de la semana
     */
    public static Map<Integer, Date> retornarUltimasSemanas(Date fechaInicioPeriodo)
    {
        Map<Integer, Date> semanas = new HashMap<Integer, Date>();

        Date date = fechaInicioPeriodo;
        Calendar hoy = Calendar.getInstance();
        Calendar fechaInicio = Calendar.getInstance();

        System.out.println( (fechaInicio.get(Calendar.DAY_OF_YEAR) - hoy.get(Calendar.DAY_OF_YEAR)) / 7);
        System.out.println( (fechaInicio.get(Calendar.DAY_OF_YEAR) - hoy.get(Calendar.DAY_OF_YEAR)) / 7);
        System.out.println( (fechaInicio.get(Calendar.DAY_OF_YEAR) - hoy.get(Calendar.DAY_OF_YEAR)) / 7);


        int dayOfWeek = fechaInicio.get(Calendar.DAY_OF_WEEK) - fechaInicio.getFirstDayOfWeek();
        fechaInicio.add(Calendar.DAY_OF_MONTH, -dayOfWeek);

        Date weekStart = fechaInicio.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
        fechaInicio.add(Calendar.DAY_OF_MONTH, 6);
        Date weekEnd = fechaInicio.getTime();

        return semanas;
    }
}
