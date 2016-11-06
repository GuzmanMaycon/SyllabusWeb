package com.junior.parser;

import org.json.JSONException;
import org.json.JSONObject;

import com.junior.to.Tema;

public class TemaJsonParser implements JsonParser<Tema>{

    public Tema parse(JSONObject object) throws JSONException
    {
        Tema nuevoTema = new Tema();
        nuevoTema.setSemana(Integer.parseInt(object.getString("semana")));
        nuevoTema.setUnidad(Integer.parseInt(object.getString("unidad")));
        nuevoTema.setDescripcion(object.getString("name"));

        return nuevoTema;
    }

}
