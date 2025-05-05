package com.klef.jfsd.sdp.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Events;

@Repository
public interface EventsRepository extends JpaRepository<Events, Integer>
{

   @Query("select e from Events e where e.eventId=?1 and e.status=?2")
   public Events checkeventstatus(int eventId, String status);
   
   
   public List<Events> findByEventId(int eventId);
   
   @Query("SELECT e FROM Events e WHERE e.eventId = ?1")
   public Events findEventById(int eventId);

   
   List<Events> findByStatus(String status);  // Get events by status
   Optional<Events> findById(int eventId);   // Get event by ID
   
}
