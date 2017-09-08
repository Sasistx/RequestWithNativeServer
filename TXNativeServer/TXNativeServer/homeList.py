from django.http import HttpResponse
from django.http import HttpRequest
import json

def list(reqest : HttpRequest):
    if  reqest.method == 'GET':
        page = reqest.GET.get("page", "0")
        dataArr = []
        for num in range(0, 10):
            id = str(int(page) * 10 + num)
            url = "https://www.baidu.com"
            info = {"id":id, "url":url}
            dataArr.append(info)
        return HttpResponse(json.dumps(dataArr))

    return HttpResponse("error !")