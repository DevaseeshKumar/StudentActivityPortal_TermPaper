package com.klef.jfsd.sdp.service;

import java.util.List;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.model.Events;

public interface AdminService
{
    public List<Faculty> viewAllFaculty();
    public List<Student> viewAllStudents();
    public List<Events> viewAllEvents();

    public Admin checkadminlogin(String uname, String pwd);
    
    public String deleteFaculty(int facultyId);
    public String deleteStudent(int studentId);
    public String deleteEvent(int eventId);

    public String updateStudent(Student student);
    public String updateFaculty(Faculty faculty);
    public String updateEvent(Events event);

    public Events getEventById(int eventId);

    


    public String addStudent(Student student);
    public String addFaculty(Faculty faculty);
    public String addEvent(Events event);

    public long facultyCount();
    public long studentCount();
    public long eventCount();
    public long totalCount();
}
