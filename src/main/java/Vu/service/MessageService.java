package Vu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Message;
import Vu.repository.MessageRepository;

@Service
public class MessageService {

	@Autowired
	private MessageRepository messageRepository;
	
	public List<Message> getListChat( int id) {
		List<Message> listMessage = new ArrayList<Message>();
		for( int accId : messageRepository.findAllAccountIdChated(id) ) {
			listMessage.add( messageRepository.findLastMessageByAccount(id, accId).get(0) );
		}
		return listMessage;
	}
	
	public List<Message> findAllMessageByAccount(int id, int friendId) {
		if(messageRepository.findAllMessageByAccount(id, friendId).size() >0 ) {
			return messageRepository.findAllMessageByAccount(id, friendId);
		}
		return null;
	}
	
	public int getLastCommentId() {
		return messageRepository.findAll().get(messageRepository.findAll().size()-1).getMessage_id();
	}
	
	public void save ( Message mess ) {
		messageRepository.save(mess);
	}
	
	public void delete ( int id ) {
		messageRepository.delete(id);
	}
	
}
