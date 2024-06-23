
package service.user;

import dal.AccountDBContext;
import dal.NotificationDBContext;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import model.Account;
import model.User;
import util.UserDataDetail;


public class UserService {

    private AccountDBContext accountDAO;
    private UserDBContext userDAO;
    private NotificationDBContext notificationDBContext;

    public UserService() {
        accountDAO = new AccountDBContext();
        userDAO = new UserDBContext();
        notificationDBContext = new NotificationDBContext();
    }

    public void updateProfile(HttpServletRequest request, HttpServletResponse response, UserDataDetail userDataDetail) throws ServletException, IOException {
        Part fPart = request.getPart("avatar");
        Account updateAcc = new Account();
        updateAcc.setUsername((String) userDataDetail.getAttribute("username"));
        Account account = (Account) userDataDetail.getAttribute("account");
        accountDAO.updateById(updateAcc, account.getId());
        User user = (User) userDataDetail.getAttribute("user");
        User updateUser = new User();
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
        updateUser.setGender(((String)userDataDetail.getAttribute("gender")).equals("Male"));
        updateUser.setDateOfBirth(java.sql.Date.valueOf((String) userDataDetail.getAttribute("dob")));
        updateUser.setAddress((String) userDataDetail.getAttribute("address"));
        updateUser.setAccount(account);
        userDAO.updateById(updateUser, user.getId());
        request.getSession().setAttribute("user", updateUser);
        request.setAttribute("success", "Update successfully!");
        request.getRequestDispatcher("WEB-INF/view/user/profile.jsp").forward(request, response);

    }
    
    public void noticeTomentor(String msg){
    }

}
