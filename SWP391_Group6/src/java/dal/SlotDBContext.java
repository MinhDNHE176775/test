/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Slot;

/**
 *
 * @author Admin
 */
public class SlotDBContext extends DBContext<Slot> {

    @Override
    public ArrayList<Slot> listAll() {
        ArrayList<Slot> slots = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Slot";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               Slot slot = new Slot();
               slot.setId(rs.getInt("id"));
               slot.setFrom(rs.getTime("from"));
               slot.setTo(rs.getTime("to"));
               slots.add(slot);
            }
        } catch (Exception e) {
        }
        return slots;
    }

    @Override
    public void insert(Slot entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Slot entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Slot entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
