/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.mentor;

import dal.AccountDBContext;
import dal.CVDBContext;
import dal.MentorDBContext;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import model.Account;
import model.CV;
import model.Mentor;
import model.Session;
import model.Slot;
import model.User;
import util.UserDataDetail;

/**
 *
 * @author Admin
 */
public class MentorService {

    private SessionDBContext sessionDAO;
    private MentorDBContext mentorDAO;
    private CVDBContext cvDBContext;
    private AccountDBContext accountDBContext;

    public MentorService() {
        sessionDAO = new SessionDBContext();
        mentorDAO = new MentorDBContext();
        cvDBContext = new CVDBContext();
        accountDBContext = new AccountDBContext();
    }

    public void createSchedule(UserDataDetail userDataDetail, HttpServletRequest request) throws SQLException, ParseException {
        Account menAccount = (Account) userDataDetail.getAttribute("account");
        Slot slot = new Slot();
        slot.setId(Integer.parseInt((String) userDataDetail.getAttribute("freeSlot")));
        Mentor mentor = mentorDAO.getByAccountId(menAccount.getId());
        mentor.setId(mentor.getId());

        String freeDate = userDataDetail.getStringAttribute("freeDate");
        String timeSlotFrom = userDataDetail.getStringAttribute("slotFrom");

        java.util.Date date = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        java.util.Date checkDate = sdf.parse((new StringBuilder().append(freeDate).append(" ").append(timeSlotFrom)).toString());
        if (checkDate.getTime() < date.getTime()) {
            request.setAttribute("dateErr", "Schedule is before compared to current date! Please choose again");
            return;
        }
        Session session = new Session();
        session.setDate(Date.valueOf((String) userDataDetail.getAttribute("freeDate")));
        session.setSlot(slot);
        session.setMentor(mentor);
        session.setSkill((String) userDataDetail.getAttribute("skill"));
        try {
            sessionDAO.insert(session);
        } catch (Exception e) {
        } finally {
            request.getSession().setAttribute("success", "Create schedule successful!");
        }
    }

    public void removeSchedule(int id, HttpServletRequest request) throws SQLException {
        try {
            sessionDAO.removeEmptyScheduleById(id);
        } catch (Exception e) {
        } finally {
            request.getSession().setAttribute("success", "Remove schedule successful!");
        }
    }

    public void processCreateCV(UserDataDetail userDataDetail, HttpServletRequest request) throws IOException, ServletException {
        Part fPart = request.getPart("avatar");
        String firstSkill = (String) userDataDetail.getAttribute("firstSkill");
        String secondSkill = (String) userDataDetail.getAttribute("secondSkill");
        String thirdSkill = (String) userDataDetail.getAttribute("thirdSkill");
        if (firstSkill.equals("none") && secondSkill.equals("none") && thirdSkill.equals("none")) {
            request.getSession().setAttribute("err", "Skills must not be none!");
        } else if (firstSkill.equals(secondSkill) || secondSkill.equals(thirdSkill) || firstSkill.equals(thirdSkill)) {
            request.getSession().setAttribute("err", "Skills must not be duplicated");
        } else {
            CV cv = new CV();
            StringBuilder sb = new StringBuilder();
            sb.append("1").append(".").append(firstSkill).append("\n");
            sb.append("2").append(".").append(secondSkill).append("\n");
            sb.append("3").append(".").append(thirdSkill).append("\n");

            if (fPart != null) {
                String fileName = Paths.get(fPart.getSubmittedFileName()).getFileName().toString();
                String fileType = fPart.getContentType();
                if (fileType.equals("image/jpeg") || fileType.equals("image/png")) {
                    String uploadDir = request.getServletContext().getRealPath("/assets/uploads/cv");
                    File uploadDirFile = new File(uploadDir);
                    if (!uploadDirFile.exists()) {
                        uploadDirFile.mkdirs();
                    }
                    String filePath = uploadDir + "\\" + fileName;
                    fPart.write(filePath);
                    cv.setAvatar(fileName);
                } else {
                    String image = request.getParameter("image-initiate");
                    cv.setAvatar(image);
                }
            }

            cv.setIntro((String) userDataDetail.getAttribute("intro"));
            cv.setAchievement((String) userDataDetail.getAttribute("achivement"));
            cv.setExperience((String) userDataDetail.getAttribute("experience"));
            cv.setCertificate((String) userDataDetail.getAttribute("certificate"));
            cv.setSkills(sb.toString());
            cv.setStatus(false);

            Mentor mentor = (Mentor) request.getSession().getAttribute("mentor");
            cv.setMentor(mentor);
            try {
                cvDBContext.insert(cv);
            } catch (Exception e) {
            }
            request.setAttribute("success", "Create CV successfully!");
        }

    }

    public void processUpdateCV(UserDataDetail userDataDetail, HttpServletRequest request) throws IOException, ServletException {
        Part fPart = request.getPart("avatar");
        String firstSkill = (String) userDataDetail.getAttribute("firstSkill");
        String secondSkill = (String) userDataDetail.getAttribute("secondSkill");
        String thirdSkill = (String) userDataDetail.getAttribute("thirdSkill");
        if (firstSkill.equals("none") && secondSkill.equals("none") && thirdSkill.equals("none")) {
            request.getSession().setAttribute("err", "Skills must not be none!");
        } else if (firstSkill.equals(secondSkill) || secondSkill.equals(thirdSkill) || firstSkill.equals(thirdSkill)) {
            request.getSession().setAttribute("err", "Skills must not be duplicated");
        } else {
            CV cv = new CV();
            StringBuilder sb = new StringBuilder();
            sb.append("1").append(".").append(firstSkill).append("\n");
            sb.append("2").append(".").append(secondSkill).append("\n");
            sb.append("3").append(".").append(thirdSkill).append("\n");

            if (fPart != null) {
                String fileName = Paths.get(fPart.getSubmittedFileName()).getFileName().toString();
                String fileType = fPart.getContentType();
                if (fileType.equals("image/jpeg") || fileType.equals("image/png")) {
                    String uploadDir = request.getServletContext().getRealPath("/resources/uploads");
                    File uploadDirFile = new File(uploadDir);
                    if (!uploadDirFile.exists()) {
                        uploadDirFile.mkdirs();
                    }
                    String filePath = uploadDir + "\\" + fileName;
                    fPart.write(filePath);
                    cv.setAvatar(fileName);
                } else {
                    String image = request.getParameter("image-initiate");
                    cv.setAvatar(image);
                }
            }

            cv.setIntro((String) userDataDetail.getAttribute("intro"));
            cv.setAchievement((String) userDataDetail.getAttribute("achivement"));
            cv.setExperience((String) userDataDetail.getAttribute("experience"));
            cv.setCertificate((String) userDataDetail.getAttribute("certificate"));
            cv.setSkills(sb.toString());
            cv.setStatus(false);

            Mentor mentor = (Mentor) request.getSession().getAttribute("mentor");
            CV menCV = cvDBContext.getCVByMentor(mentor.getId());
            cv.setId(menCV.getId());
            try {
                cvDBContext.updateCV(cv);
            } catch (Exception e) {
            }
            request.getSession().setAttribute("update_success", "Update CV successfully!");
        }

    }

    public void updateProfile(HttpServletRequest request, HttpServletResponse response, UserDataDetail userDataDetail) throws ServletException, IOException {
        Part fPart = request.getPart("avatar");
        Account updateAcc = new Account();
        updateAcc.setUsername((String) userDataDetail.getAttribute("username"));
        Account account = (Account) userDataDetail.getAttribute("account");
        accountDBContext.updateById(updateAcc, account.getId());
        Mentor user = (Mentor) userDataDetail.getAttribute("mentor");
        Mentor updateUser = new Mentor();
        if (fPart != null) {
            String fileName = Paths.get(fPart.getSubmittedFileName()).getFileName().toString();
            String fileType = fPart.getContentType();
            if (fileType.equals("image/jpeg") || fileType.equals("image/png") || fileType.equals("images/jpg")) {
                String uploadDir = request.getServletContext().getRealPath("/resources/uploads");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                String filePath = uploadDir + "\\" + fileName;
                fPart.write(filePath);
                updateUser.setAva(fileName);
            } else {
                String image = request.getParameter("image-initiate");
                updateUser.setAva(image);
            }
        }

        updateUser.setName((String) userDataDetail.getAttribute("fullname"));
        updateUser.setGender(((String) userDataDetail.getAttribute("gender")).equals("Male"));
        updateUser.setDateOfBirth(java.sql.Date.valueOf((String) userDataDetail.getAttribute("dob")));
        updateUser.setAddress((String) userDataDetail.getAttribute("address"));
        updateUser.setAccount(account);
        mentorDAO.updateById(updateUser, user.getId());
        request.getSession().setAttribute("mentor", updateUser);
        request.setAttribute("success", "Update successfully!");
        request.getRequestDispatcher("WEB-INF/view/mentor/profile_mentor.jsp").forward(request, response);

    }

    public void processSubmitFreeSession(UserDataDetail userDataDetail) {
        String submittedFreeSessions = userDataDetail.getStringAttribute("selectedFreeSessions");
        Mentor mentor = (Mentor) userDataDetail.getAttribute("mentor");
        String[] sessions = submittedFreeSessions.split(",");
        for (String session : sessions) {
            String[] detailSession = session.split(" ");
            Session newSession = new Session();
            Slot slot = new Slot();
            slot.setId(Integer.parseInt(detailSession[2]));
            newSession.setDate(java.sql.Date.valueOf(detailSession[0]));
            newSession.setMentor(mentor);
            newSession.setSlot(slot);
            sessionDAO.insert(newSession);
        }
    }

}
