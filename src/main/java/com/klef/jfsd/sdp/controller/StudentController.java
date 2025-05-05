package com.klef.jfsd.sdp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.sdp.model.Events;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    // Show login page
    @GetMapping("studentlogin")
    public ModelAndView studentlogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentlogin");
        return mv;
    }

    // Show logout page (clear session and redirect to login)
    @GetMapping("studentlogout")
    public ModelAndView studentlogout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate(); // Invalidate session to log out
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentlogin");
        return mv;
    }

    // Show student home page
    @GetMapping("studenthome")
    public ModelAndView studenthome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studenthome");
        return mv;
    }

    // Check student login credentials
    @PostMapping("checkstudentlogin")
    public ModelAndView checkstudentlogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Student student = studentService.checkstudentlogin(email, password);

        if (student != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("student", student);
            mv.setViewName("studenthome");
        } else {
            mv.setViewName("studentloginfail");
            mv.addObject("message", "Login Failed");
        }

        return mv;
    }

    // View all events
    @GetMapping("stuviewallevents")
    public ModelAndView viewAllEvents() {
        ModelAndView mv = new ModelAndView();

        long ecount = studentService.eventCount();
        mv.addObject("ecount", ecount);

        List<Events> eventList = studentService.viewAllEvents();

        mv.setViewName("stuviewallevents");
        mv.addObject("eventList", eventList);

        return mv;
    }

    // Show student profile
    @GetMapping("stuprofile")
    public ModelAndView stuprofile() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("stuprofile");
        return mv;
    }

    // Update student profile page
    @GetMapping("updatestuprofile")
    public ModelAndView updatestuprofile() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("updatestuprofile");
        return mv;
    }

    // Update student profile details
    @PostMapping("editstuprofile")
    public ModelAndView updateStudent(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("sid"));
        String name = request.getParameter("sname");
        String password = request.getParameter("spwd");
        String department = request.getParameter("sdept");
        String contact = request.getParameter("scontact");
        String gender = request.getParameter("sgender");
        String dob = request.getParameter("sdob");

        Student student = new Student();
        student.setId(id);
        student.setName(name);
        student.setPassword(password);
        student.setDepartment(department);
        student.setContactno(contact);
        student.setGender(gender);
        student.setDob(dob);

        String msg = studentService.updateStudent(student);

        ModelAndView mv = new ModelAndView("stuprofileupdated");
        mv.addObject("message", msg);

        return mv;
    }

    // Register for events page
    @GetMapping("registerevent")
    public ModelAndView registerforevent() {
        ModelAndView mv = new ModelAndView();
        List<Events> eventList = studentService.viewAllEvents();

        long ecount = studentService.eventCount();
        mv.addObject("ecount", ecount);
        mv.setViewName("registerevent");
        mv.addObject("eventList", eventList);

        return mv;
    }

    // Register for a specific event
    @PostMapping("stueventreg")
    public ModelAndView registerForEvent(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            return new ModelAndView("redirect:studentlogin");
        }

        int studentId = student.getId();
        int eventId = Integer.parseInt(request.getParameter("eventId"));

        String message = studentService.registerForEvent(studentId, eventId);

        redirectAttributes.addFlashAttribute("message", message);
        return new ModelAndView("redirect:stuviewallevents");
    }

    // View the registered events
    @GetMapping("/viewRegisteredEvents")
    public String viewRegisteredEvents(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");

        if (student != null) {
            List<Events> registeredEvents = studentService.getRegisteredEvents(student.getId());
            model.addAttribute("registeredEvents", registeredEvents);
            return "viewRegisteredEvents"; // The JSP page to show registered events
        }

        // Redirect to login page if no student is logged in
        return "redirect:/studentlogin";
    }
}
