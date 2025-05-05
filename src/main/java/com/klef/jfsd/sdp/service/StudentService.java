package com.klef.jfsd.sdp.service;

import java.util.List;
import com.klef.jfsd.sdp.model.Events;
import com.klef.jfsd.sdp.model.Student;

public interface StudentService 
{
    public List<Events> viewAllEvents();
    
    public String registerForEvent(int studentId, int eventId);

    
    public String updateStudent(Student student);
    
    public Student checkstudentlogin(String email, String password);
    
    public List<Events> getRegisteredEvents(int studentId);

    public long eventCount();
}
