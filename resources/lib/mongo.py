from pymongo import MongoClient
import bson

# Host: ds155903.mlab.com
# Port: 55903
# User: qaninja
# Pwd: qaninja123
# Database: bikelovdb

# "mongodb://usuario:senha@servidor:porta/bancodedados"

client = MongoClient("mongodb://qaninja:qaninja123@ds155903.mlab.com:55903/bikelovdb?retryWrites=false")
db = client['bikelovdb']

def remove_bike(name):
    bikes = db['bikes']
    bikes.delete_many({'name': name})

def create_bike_ad(ad, user_id):
    remove_bike(ad['name'])
    bikes = db['bikes']
    ad["user"] = bson.objectid.ObjectId(user_id)
    return bikes.insert_one(ad).inserted_id

def get_mongo_id():
    return bson.objectid.ObjectId()