from django.http import HttpResponse
from django.http import HttpRequest
import json

user_info = {"user_name":"Jack"}

def login(reqest:HttpRequest):
    if  reqest.method == "POST":

        if reqest.POST.get("name", None) == "Jack" and reqest.POST.get("pwd", None) == "1234":
            return HttpResponse(json.dumps(user_info))

        httpResp = HttpResponse("login error : incorrect username or pwd")
        httpResp.status_code = 400
        return httpResp

    httpResp = HttpResponse("error")
    httpResp.status_code = 403
    return httpResp
