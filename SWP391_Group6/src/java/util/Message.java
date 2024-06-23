/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Message {
    private static final SimpleDateFormat sdf = new SimpleDateFormat();
    public static final String HOST_EMAIL = "vuvthe173552@fpt.edu.vn";
    public static final String HOST_PASSWORD = "muqt sosf eoqr fdhq";
    public static final String GENERATION_PASSWORD = "abcdefgfijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%&*";
    public static final String START_TIME = (new StringBuilder().append((new SimpleDateFormat("yyyy-MM-dd")).format(new Date())).append(" 07:00:00")).toString();
    public static final String END_TIME = (new StringBuilder().append((new SimpleDateFormat("yyyy-MM-dd")).format(new Date())).append(" 23:00:00")).toString();
}
