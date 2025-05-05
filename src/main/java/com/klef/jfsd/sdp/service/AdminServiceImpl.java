package com.klef.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Events;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.repository.AdminRepository;
import com.klef.jfsd.sdp.repository.EventsRepository;
import com.klef.jfsd.sdp.repository.FacultyRepository;
import com.klef.jfsd.sdp.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private FacultyRepository facultyRepository;
    
    @Autowired
    private StudentRepository studentRepository;
    
    @Autowired
    private EventsRepository eventsRepository;

    @Autowired
    private AdminRepository adminRepository;

    // View all methods
    @Override
    public List<Faculty> viewAllFaculty() {
        return facultyRepository.findAll();
    }

    @Override
    public List<Student> viewAllStudents() {
        return studentRepository.findAll();
    }

    @Override
    public List<Events> viewAllEvents() {
        return eventsRepository.findAll();
    }


    @Override
    public Admin checkadminlogin(String uname, String pwd) {
        return adminRepository.checkadminlogin(uname, pwd);
    }


    @Override
    public String deleteFaculty(int facultyId) {
        facultyRepository.deleteById(facultyId);
        return "Faculty deleted successfully";
    }

    @Override
    public String deleteStudent(int studentId) {
        studentRepository.deleteById(studentId);
        return "Student deleted successfully";
    }

    @Override
    public String deleteEvent(int eventId) {
        eventsRepository.deleteById(eventId);
        return "Event deleted successfully";
    }


    @Override
    public String updateStudent(Student student) {
        studentRepository.save(student);
        return "Student updated successfully";
    }

    @Override
    public String updateFaculty(Faculty faculty) {
        facultyRepository.save(faculty);
        return "Faculty updated successfully";
    }

    @Override
    public String updateEvent(Events event) {
        eventsRepository.save(event);
        return "Event updated successfully";
    }

    @Override
    public String addStudent(Student student) {
        studentRepository.save(student);
        return "Student added successfully";
    }

    @Override
    public String addFaculty(Faculty faculty) {
        facultyRepository.save(faculty);
        return "Faculty added successfully";
    }

    @Override
    public String addEvent(Events event) {
        eventsRepository.save(event);
        return "Event added successfully";
    }

  
    @Override
    public long facultyCount() {
        return facultyRepository.count();
    }

    @Override
    public long studentCount() {
        return studentRepository.count();
    }

    @Override
    public long eventCount() {
        return eventsRepository.count();
    }

    @Override
    public long totalCount() {
        return facultyCount() + studentCount() + eventCount();
    }

	
	@Override
	public Events getEventById(int eventId) {
	    return eventsRepository.findById(eventId).orElse(null);
	}

}
