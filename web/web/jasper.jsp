/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import bean.mybean;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import org.hsqldb.lib.HashMap;
/**
 *
 * @author ketulshah
 */
public class loginservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JRException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String name=request.getParameter("name");
            String add=request.getParameter("add");
            String phone=request.getParameter("phone");
            String pin=request.getParameter("pin");
             out.print(name+"@@");
            jasperBean obj=new jasperBean();
            obj.setName(name);
            obj.setAddress(add);
            obj.setPhone(phone);
            obj.setPin(pin);
            ArrayList arr=new ArrayList();
            arr.add(obj);
           generatepdf(arr,out);
        } finally {            
            out.close();
        }
    }
 void generatepdf(ArrayList obj,PrintWriter request) 
 {
    File jasperfile=null;
    JasperPrint jp=null;
    JRDataSource jd=new JRBeanCollectionDataSource(obj);
    jasperfile=new File("C:/Users/ketulshah/Desktop/myFirst.jasper");
    request.println(jasperfile);
    JasperReport jr1=null;
    try{
    jr1=(JasperReport)JRLoader.loadObject(new FileInputStream(jasperfile));
    request.println(jr1);
    jr1.setProperty("net.sf.jasperreports.awt.ignore.missingfont","true");
    jr1.setProperty("net.sf.jasperreports.default.fontname","akshar.ttf");
    jr1.setProperty("net.sf.jasperreports.default.pdf.font.name","akshar.ttf");
    }catch(Exception e){System.out.println(e+"1");}
    try{
    jp=JasperFillManager.fillReport(jr1,null, jd);
    request.println("<br/>"+jp);
    }catch(Exception e){System.out.println(e+"2");}
    try{
     JasperExportManager.exportReportToPdfFile(jp,"C:/Users/ketulshah/Desktop/jasperShopping.pdf");
    }catch(Exception e){System.out.println(e+"3");}
     request.println("hiiiiii");
     System.out.print("hello");
 }        
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(loginservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(loginservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
