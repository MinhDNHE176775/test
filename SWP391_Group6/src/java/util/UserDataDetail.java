/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class UserDataDetail {

    private Map<String, Object> attributes;

    public UserDataDetail() {
        attributes = new HashMap<>();
    }

    public void putAttribute(String key, Object value) {
        attributes.put(key, value);
    }

    public void putAttribute(String key, int value) {
        attributes.put(key, value);
    }

    public void putAttribute(String key, String value) {
        attributes.put(key, value);
    }

    public Object getAttribute(String key) {
        return attributes.get(key);
    }

    public int getIntegerAttribute(String key) {
        return (int) attributes.get(key);
    }

    public String getStringAttribute(String key) {
        return (String) attributes.get(key);
    }

}