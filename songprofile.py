import json
import boto3
import requests

# THIS WORKS, DON'T CHANGE
def lambda_handler(event, context):
    # TODO implement
    dynamodb = boto3.resource('dynamodb', region_name='us-west-2')
    table = dynamodb.Table('userDB2')
    
    # not sure how to get ID from Jenny. 
    
    keyNew = table.get_item(Key={'id': '40'})
    
   # print(keyNew)
    
    keyString = keyNew['Item']['placeholder']
    
   # print(type(keyString))
    
    response = table.get_item(Key={'id': keyString})
   # print(response)
    item = response['Item']
    #print(response)
   # print(item)
    # print(response['Item']['dislike']) # this works
    id = response['Item']['id']
    song = response['Item']['songName']
    artist = response['Item']['artist']
    dislike = response['Item']['dislike']
    like = response['Item']['dislike']
    albumart = response['Item']['albumArt']
    albumartTest = response['Item']['album2']
    
    # table.update_item(
    #     Key={'id':'2', 'songName': 'For You'},
    #     UpdateExpression = "SET #like = #like + :incr",
    #     ExpressionAttributeValues={
    #         ":incr": 1
    #     }
    # )
    
    input = {'id': id, 'songName': song, 'like': like, 'artist': artist, 'albumart': albumart, 'albumTest': albumartTest}
    #print("this is input: ", input)
    
    return {
        'statusCode': 200,
        'body': input
        }
