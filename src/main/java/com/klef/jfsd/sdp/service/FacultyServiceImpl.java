package com.klef.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Events;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.repository.EventsRepository;
import com.klef.jfsd.sdp.repository.FacultyRepository;
import com.klef.jfsd.sdp.repository.StudentRepository;

@Service
public class FacultyServiceImpl implements FacultyService {
    
    @Autowired
    private StudentRepository studentRepository;
    
    @Autowired
    private EventsRepository eventsRepository;

    @Autowired
    private FacultyRepository facultyRepository;

    @Override
    public String addStudent(Student student) {
        studentRepository.save(student);
        return "Student added successfully";
    }

    @Override
    public String addEvent(Events event) {
        eventsRepository.save(event);
        return "Event added successfully";
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
    public String updateStudent(Student student) {
        if (studentRepository.existsById(student.getId())) {
            studentRepository.save(student);
            return "Student updated successfully";
        }
        return "Student not found";
    }

    @Override
    public String updateEvent(Events event) {
        if (eventsRepository.existsById(event.getEventId())) {
            eventsRepository.save(event);
            return "Event updated successfully";
        }
        return "Event not found";
    }

    @Override
    public String deleteStudent(int studentId) {
        if (studentRepository.existsById(studentId)) {
            studentRepository.deleteById(studentId);
            return "Student deleted successfully";
        }
        return "Student not found";
    }

    @Override
    public String deleteEvent(int eventId) {
        if (eventsRepository.existsById(eventId)) {
            eventsRepository.deleteById(eventId);
            return "Event deleted successfully";
        }
        return "Event not found";
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
    public String FacultyRegistration(Faculty faculty) {
        facultyRepository.save(faculty);
        return "Faculty registered successfully";
    }

    @Override
    public String updateFaculty(Faculty f) {
        Faculty faculty = facultyRepository.findById(f.getId()).get();

        faculty.setName(f.getName());
        faculty.setPassword(f.getPassword());
        faculty.setDepartment(f.getDepartment());
        faculty.setContactno(f.getContactno());
        faculty.setLocation(f.getLocation());

        facultyRepository.save(faculty);

        return "Faculty Updated Successfully";
    }


    @Override
    public String deleteFaculty(int facultyId) {
        if (facultyRepository.existsById(facultyId)) {
            facultyRepository.deleteById(facultyId);
            return "Faculty deleted successfully";
        }
        return "Faculty not found";
    }

	@Override
	public Faculty checkfaclogin(String femail, String fpwd) {
	    return facultyRepository.checkfaclogin(femail, fpwd);
	}

}
