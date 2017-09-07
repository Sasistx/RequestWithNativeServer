from django.http import HttpResponse


def hello(reqest):
    return HttpResponse("Hello !")
