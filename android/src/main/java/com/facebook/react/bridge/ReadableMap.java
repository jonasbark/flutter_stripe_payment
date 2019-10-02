package com.facebook.react.bridge;

import java.util.HashMap;

/**
 * Created by FFuF, Jonas Bark on 2019-10-02.
 */
public class ReadableMap extends HashMap<String, Object> {

    public boolean hasKey(String key) {
        return containsKey(key);
    }

    public String getString(String key) {
        return (String) get(key);
    }

    public Boolean getBoolean(String key) {
        return (Boolean) get(key);
    }

    public ReadableArray getArray(String key) {
        return (ReadableArray) get(key);
    }

    public Integer getInt(String key) {
        return (Integer) get(key);
    }

    public ReadableMap getMap(String key) {
        return (ReadableMap) get(key);
    }
}
