package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{

   @Query("select s from Student s where s.email=?1 and s.password=?2")
   public Student checkstudentlogin(String email, String password);
}
