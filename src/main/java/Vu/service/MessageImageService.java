package Vu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Message_Image;
import Vu.repository.MessageImageRepository;

@Service
public class MessageImageService {

	@Autowired
	private MessageImageRepository messageImageRepository;
	
	public void save(Message_Image mi) {
		messageImageRepository.save(mi);
	}
	
	public void deleteByComment(int messageId) {
		for(Message_Image mi : messageImageRepository.findAllByMessage(messageId)) {
			messageImageRepository.delete(mi.getImage_id());
		}
	}
	
	public void delete ( int id ) {
		messageImageRepository.delete(id);
	}
}
