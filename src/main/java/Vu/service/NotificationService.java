package Vu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Notification;
import Vu.repository.NotificationRepository;

@Service
public class NotificationService {

	@Autowired
	private NotificationRepository notificationRepository;
	
	public List<Notification> findAllByAccountId( int id ) {
		return notificationRepository.findAllByAccountId(id);
	}
	
	public void save( Notification noti ) {
		notificationRepository.save( noti );
	}
	
	public void delete( int id ) {
		notificationRepository.delete( id );
	}
}
