package com.junior.parser;

import org.json.JSONException;
import org.json.JSONObject;

public interface JsonParser<T> {
    public T parse(JSONObject object) throws JSONException;
}
