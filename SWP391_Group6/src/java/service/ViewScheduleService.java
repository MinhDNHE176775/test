/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import com.google.gson.JsonObject;
import dal.SlotDBContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import model.Session;
import model.Slot;
import util.Util;

/**
 *
 * @author Admin
 */
public class ViewScheduleService {

    private final SlotDBContext slotDAO;

    public ViewScheduleService() {
        slotDAO = new SlotDBContext();
    }

    public void viewSchedule(HttpServletRequest request) {
        LocalDate localDate = LocalDate.now();
        Locale asiaLocale = new Locale("vi", "VN");
        WeekFields weekFields = WeekFields.of(asiaLocale);
        Map<java.sql.Date, java.sql.Date> weeksOnYear = Util.getWeeksByYear(localDate.getYear());
        ArrayList<Slot> slots = slotDAO.listAll();
        ArrayList<java.sql.Date> dates = null;
        Set<java.sql.Date> keySet = weeksOnYear.keySet();
        for (java.sql.Date object : keySet) {
            if (localDate.get(weekFields.weekOfYear()) == object.toLocalDate().get(weekFields.weekOfYear())) {
                dates = Util.getDatesBetween(object, weeksOnYear.get(object));
                break;
            }
        }
        request.getSession().setAttribute("dates", dates);
        request.setAttribute("currentWeek", localDate.get(weekFields.weekOfYear()));
        request.getSession().setAttribute("slots", slots);
        request.getSession().setAttribute("weeks_on_year", weeksOnYear);
        request.getSession().setAttribute("year", localDate.getYear());
    }

    public void viewScheduleByChange(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String week = request.getParameter("weeks");
        String weeks[] = week.split(" ");
        java.sql.Date from = java.sql.Date.valueOf(weeks[0]);
        java.sql.Date to = java.sql.Date.valueOf(weeks[1]);
        ArrayList<java.sql.Date> dates = Util.getDatesBetween(from, to);
        Locale asiaLocale = new Locale("vi", "VN");
        WeekFields weekFields = WeekFields.of(asiaLocale);
        request.getSession().setAttribute("dates", dates);
        ArrayList<Slot> slots = (ArrayList<Slot>) request.getSession().getAttribute("slots");
        request.setAttribute("changeWeek", from.toLocalDate().get(weekFields.weekOfYear()));
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JsonObject responseObject = new JsonObject();
        responseObject.add("slots", Util.addJsonArrayFile(slots, "slot"));
        responseObject.addProperty("changeWeek", from.toLocalDate().get(weekFields.weekOfYear()));
        // Xây dựng đối tượng chứa dữ liệu để chuyển thành JSON
        Map<Date, Date> weeksOnYear = (Map<Date, Date>) request.getSession().getAttribute("weeks_on_year");
        String[] str = request.getParameterValues("datePicked");
        Set<Date> keyDates = weeksOnYear.keySet();
        Locale locale = new Locale("vi", "VN");
        ArrayList<String> weeks_on_year = new ArrayList<>();
        for (Date date : keyDates) {
            String key = Util.formatSqlDate(date);
            String value = Util.formatSqlDate(weeksOnYear.get(date));
            WeekFields weeeks = WeekFields.of(locale);
            int week1 = date.toLocalDate().get(weeeks.weekOfYear());
            weeks_on_year.add((new StringBuilder().append(key).append(",").append(value).append(",week:").append(week1)).toString());
        }
        ArrayList<String> weekDates = new ArrayList<>();
        for (Date date : dates) {
            String weekDate = Util.formatSqlDate(date);
            weekDates.add(weekDate);
        }
        
        if(str != null){
            ArrayList<String> pii = new ArrayList<>();
            pii.addAll(Arrays.asList(str));
            responseObject.add("pickedDates", Util.addJsonArrayFile(pii, "kk"));
        }
        ArrayList<Session> sessions = (ArrayList<Session>) request.getSession().getAttribute("sessions");
        responseObject.add("sessions", Util.addJsonArrayFile(sessions, "session"));
        responseObject.add("dates", Util.addJsonArrayFile(weekDates, "date"));
        responseObject.add("weeks_on_year", Util.addJsonArrayFile(weeks_on_year, "week"));
        PrintWriter out = response.getWriter();
        out.print(responseObject.toString());
        out.flush();
    }

}

