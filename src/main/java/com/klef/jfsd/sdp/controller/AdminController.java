package com.klef.jfsd.sdp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Events;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		long scount = adminService.studentCount();
		mv.addObject("scount",scount);
		long fcount = adminService.facultyCount();
		mv.addObject("fcount",fcount);
		long ecount = adminService.eventCount();
		mv.addObject("ecount",ecount);
		return mv;

	}
	
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@GetMapping("adminlogout")
	public ModelAndView adminlogout() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request) 
	{
		
		ModelAndView mv = new ModelAndView();
		String auname = request.getParameter("auname");
		String upwd = request.getParameter("apwd");
		
		Admin admin = adminService.checkadminlogin(auname, upwd);
		
		if(admin!=null) 
		{
			mv.setViewName("adminhome");
			
			
			long scount = adminService.studentCount();
			mv.addObject("scount",scount);
			long fcount = adminService.facultyCount();
			mv.addObject("fcount",fcount);
			long ecount = adminService.eventCount();
			mv.addObject("ecount",ecount);
		}
		
		else 
		{
			mv.setViewName("adminloginfail");
			mv.addObject("message","Login Failed");
		}
		
		return mv;
	}
	
	
	@GetMapping("viewallfaculty")
	  public ModelAndView viewallfac() 
	  {
	    ModelAndView mv = new ModelAndView();
	    long fcount = adminService.facultyCount();
		mv.addObject("fcount",fcount);
	    List<Faculty> faclist = adminService.viewAllFaculty();
	    mv.setViewName("viewallfac");
	    mv.addObject("faclist", faclist);
	    return mv;
	  }
	
	
	@GetMapping("deletefaculty")
	  public ModelAndView deletefaculty() 
	  {
	    ModelAndView mv = new ModelAndView();
	    long fcount = adminService.facultyCount();
		mv.addObject("fcount",fcount);
	    List<Faculty> faclist = adminService.viewAllFaculty();
	    mv.setViewName("deletefaculty");
	    mv.addObject("faclist", faclist);
	    return mv;
	  }
	
	@GetMapping("delete")
	   public String delete(@RequestParam("id")  int facultyId)
	   {
		   adminService.deleteFaculty(facultyId);
		   return "redirect:/deletefaculty";
	   }
	
	
	
	
	
	
	
	
	
	
	@GetMapping("studentreg")
    public ModelAndView studentreg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentreg"); 
        return mv;
    }
	
	@PostMapping("insertstudent")
    public ModelAndView insertStudent(HttpServletRequest request) {
        String name = request.getParameter("fname");
        String password = request.getParameter("fpwd");
        String email = request.getParameter("femail");
        String department = request.getParameter("fdept");
        String contactno = request.getParameter("fcontact");
        String gender = request.getParameter("fgender");
        String dob = request.getParameter("fdob");
        
        Student student = new Student();
        student.setName(name);
        student.setPassword(password);
        student.setEmail(email);
        student.setDepartment(department);
        student.setContactno(contactno);
        student.setGender(gender);
        student.setDob(dob);
        student.setEventsRegistered("");
        
        String msg = adminService.addStudent(student);
        
        ModelAndView mv = new ModelAndView("studentaddsuccess");
        mv.addObject("message", msg);
        
        return mv;
    }
	
	
	@GetMapping("viewallstudents")
	public ModelAndView viewAllStudents() {
	    ModelAndView mv = new ModelAndView();
	    
	    long scount = adminService.studentCount();
		mv.addObject("scount",scount);
	    
	    List<Student> studentList = adminService.viewAllStudents();
	    
	    mv.setViewName("viewallstudents");
	    mv.addObject("studentList", studentList);
	    
	    return mv;
	}
	
	
	@GetMapping("deletestudent")
	  public ModelAndView deletestudent() 
	  {
	    ModelAndView mv = new ModelAndView();
	    long scount = adminService.studentCount();
		mv.addObject("scount",scount);
	    List<Student> studentList = adminService.viewAllStudents();
	    mv.setViewName("deletestudent");
	    mv.addObject("studentList", studentList);
	    return mv;
	  }
	
	@GetMapping("deletestu")
	   public String deletestudent(@RequestParam("id")  int student_id)
	   {
		   adminService.deleteStudent(student_id);
		   return "redirect:/deletestudent";
	   }
	
	
	
	
	@GetMapping("addevent")
    public ModelAndView addevent() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addevent");  
        return mv;
    }
	
	
	
	
	@PostMapping("insertevent")
	public ModelAndView insertEvent(HttpServletRequest request) {
	    
	    String name = request.getParameter("ename");
	    String description = request.getParameter("edescription");
	    String date = request.getParameter("edate");
	    String eventTime = request.getParameter("etime");
	    String status = request.getParameter("estatus");
	    int totalCount = Integer.parseInt(request.getParameter("etotalcount"));

	  
	    Events event = new Events();
	    event.setName(name);
	    event.setDescription(description);
	    event.setDate(date);
	    event.setEventTime(eventTime);
	    event.setStatus(status);
	    event.setStudentsRegisteredCount(0); 
	    event.setTotalCount(totalCount);

	    
	    String msg = adminService.addEvent(event);

	   
	    ModelAndView mv = new ModelAndView("eventaddsuccess");
	    mv.addObject("message", msg);

	    return mv;
	}

	
	@GetMapping("viewallevents")
	public ModelAndView viewAllEvents() {
	    ModelAndView mv = new ModelAndView();
	    
	   
	    long ecount = adminService.eventCount();
		mv.addObject("ecount",ecount);
	    
	   
	    List<Events> eventList = adminService.viewAllEvents();
	    
	    
	    mv.setViewName("viewallevents");
	    mv.addObject("eventList", eventList);
	    
	    return mv;
	}
	
	@GetMapping("deleteevent")
	  public ModelAndView deleteevent() 
	  {
	    ModelAndView mv = new ModelAndView();
	    long ecount = adminService.eventCount();
		mv.addObject("ecount",ecount);
	    List<Events> eventList = adminService.viewAllEvents();
	    mv.setViewName("deleteevent");
	    mv.addObject("eventList", eventList);
	    return mv;
	  }
	
	@GetMapping("deleteeve")
	   public String deleteevent(@RequestParam("id")  int eventId)
	   {
		   adminService.deleteEvent(eventId);
		   return "redirect:/deleteevent";
	   }
	
	
	@GetMapping("updateevent")
	public ModelAndView showUpdateEventPage() {
	    ModelAndView mv = new ModelAndView();
	    
	    long ecount = adminService.eventCount(); 
	    mv.addObject("ecount", ecount);
	    
	    List<Events> eventList = adminService.viewAllEvents(); 
	    mv.addObject("eventList", eventList); 
	    
	    mv.setViewName("updateevent"); 
	    return mv;
	}
	
	@GetMapping("editevent")
	public ModelAndView editEvent(@RequestParam("eventId") int eventId) {
	    ModelAndView mv = new ModelAndView();
	    
	    Events event = adminService.getEventById(eventId); 
	    mv.addObject("event", event);
	    
	    mv.setViewName("editevent"); 
	    return mv;
	}
	
	
	
	@PostMapping("updateeventdetails")
	public String updateEventDetails(@RequestParam("eventId") int eventId,
	                                 @RequestParam("name") String name,
	                                 @RequestParam("description") String description,
	                                 @RequestParam("date") String date,
	                                 @RequestParam("time") String eventTime,
	                                 @RequestParam("status") String status) {

	   
	    Events event = adminService.getEventById(eventId);

	    
	    event.setName(name);
	    event.setDescription(description);
	    event.setDate(date);
	    event.setEventTime(eventTime);
	    event.setStatus(status);

	    
	    adminService.updateEvent(event);

	    
	    return "redirect:/updateevent";
	}
	
}
