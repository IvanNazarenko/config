#########################################
#                                       #
#       My first lambda function        #
#             02.10.2020                #
#         Get list of buckets           #
#                                       #
#########################################

import boto3, os        #boto3 - библеотека для лямбды
def lambda_handler(event, context): #главная функция

        myS3 = boto3.client('s3')       #создаем обьект с название mys3
        try:
          results = myS3.list_buckets()  #получаем список бакетов результат
          print (results)                #печатаем результаты
          output = ""
          for bucket in results['Buckets']:    #проходим по бакетам
                output = output + bucket['Name'] + "<br>" #получаем только имя
          return ("<h1><font color=green>S3 Bucket List:</fornt></h1><br><br>" + output)
        except:
          return ("<h1><font color=red>Error!</font></h1><br><br>")


#########################################
#                                       #
#             02.10.2020                #
#         Create s3 bucket              #
#                                       #
#########################################



import boto3,os,time

AWS_DEFAULT_REGION = "us-east-2"
os.environ ['AWS_DEFAULT_REGION'] = AWS_DEFAULT_REGION  #экспорт в окружение
bucketname = "lambda.created.me.on" + str(time.time())  #формирование имя бакета
def lambda_handler(event, context):
        myS3 = boto3.resource('s3')
        try:
                results = myS3.create_bucket(
                        Bucket = bucketname,
                        CreateBucketConfiguration = {'LocationConstraint': AWS_DEFAULT_REGION}
                )
                return ("<h1><font color=green>S3 Bucket Created Susseccfully:</fornt></h1><br><br>"+str(results))
        except:
                return ("<h1><font color=red>Error!</font></h1><br><br>")
