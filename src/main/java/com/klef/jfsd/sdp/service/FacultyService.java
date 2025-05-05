package com.klef.jfsd.sdp.service;

import java.util.List;
import com.klef.jfsd.sdp.model.Events;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.Student;

public interface FacultyService 
{

    public String FacultyRegistration(Faculty faculty);
    public String addStudent(Student student);
    public String addEvent(Events event);

    public List<Student> viewAllStudents();
    public List<Events> viewAllEvents();
    
    public String updateStudent(Student student);
    public String updateEvent(Events event);
    public String updateFaculty(Faculty faculty);
    
    public String deleteStudent(int studentId);
    public String deleteEvent(int eventId);
    public String deleteFaculty(int facultyId);

    public long studentCount();
    public long eventCount();
    
    public Faculty checkfaclogin(String femail, String fpwd);
}
