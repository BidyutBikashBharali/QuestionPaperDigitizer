package com.db.util;


import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;

import org.bson.Document;




public class MongoAccess {
	
	private static MongoAccess mgcnn = null;
	
	private MongoCollection<Document> record_collection;
	private MongoCollection<Document> data_collection;
	
	private  MongoAccess() {
		MongoClient mongoClient = MongoClients.create("URI Connection String Of MongoDB Atlas");
		MongoDatabase database = mongoClient.getDatabase("OCRProjectDB"); //Database name
		this.record_collection = database.getCollection("record_collection"); // Collection name
		this.data_collection = database.getCollection("data_collection");  // Collection name
		
	}
	
	
	
	public MongoCollection<Document> getRecord_Collection(){
		return record_collection;
	}
	
	public MongoCollection<Document> getData_Collection(){
		return data_collection;
	}
	
	
	public static MongoAccess getInstance() {
		if(mgcnn == null) {
			mgcnn = new MongoAccess();
			System.out.println("Initialized For The First Time");
		}
		System.out.println("Already Initialized");
		return mgcnn;
	}
	
}

