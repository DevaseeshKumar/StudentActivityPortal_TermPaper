package com.klef.jfsd.sdp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.klef.jfsd.sdp.model.Events;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.repository.EventsRepository;
import com.klef.jfsd.sdp.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private EventsRepository eventsRepository;

    @Override
    public List<Events> viewAllEvents() {
        return eventsRepository.findAll();
    }

    @Override
    public String registerForEvent(int studentId, int eventId) {
        Student student = studentRepository.findById(studentId).orElse(null);
        Events event = eventsRepository.findEventById(eventId);

        if (student != null && event != null) {
            // Check if already registered
            if (student.getRegisteredEvents().contains(event)) {
                return "You are already registered for this event.";
            }

            // Add event to student's registered events
            student.getRegisteredEvents().add(event);

            // Update event count
            event.setStudentsRegisteredCount(event.getStudentsRegisteredCount() + 1);
            studentRepository.save(student);
            eventsRepository.save(event);

            return "Registration successful!";
        }
        return "Registration failed. Student or Event not found.";
    }


    @Override
    public String updateStudent(Student s) {
        Student student = studentRepository.findById(s.getId()).get();

        student.setName(s.getName());
        student.setPassword(s.getPassword());
        student.setDepartment(s.getDepartment());
        student.setContactno(s.getContactno());
        student.setGender(s.getGender());
        student.setDob(s.getDob());

        studentRepository.save(student);

        return "Student Updated Successfully";
    }

    @Override
    public long eventCount() {
        return eventsRepository.count();
    }

    @Override
    public Student checkstudentlogin(String email, String password) {
        return studentRepository.checkstudentlogin(email, password);
    }
    
    public List<Events> getRegisteredEvents(int studentId) {
        // Fetch student by ID
        Student student = studentRepository.findById(studentId).orElse(null);

        if (student != null) {
            return student.getRegisteredEvents(); // Return the registered events
        }

        return null; // Return null if student is not found
    }
}
