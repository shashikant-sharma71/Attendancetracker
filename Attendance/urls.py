"""
URL configuration for Hello project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path 
from .import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.user_login, name='login'),
    path('index/', views.index, name='index'), 
    path('register/student/',views.register_student,name='register_student'),
    path('register/faculty/',views.register_faculty,name='register_faculty'),
    path('register/subject/',views.register_subject,name='register_subject'),
    
    path('mark/',views.mark_attendance,name='mark_attendance'),
    path('attendance-success/',views.attendance_success,name='attendance_success'),

    path('logout/', views.user_logout, name='logout'),
    
    path('admin_dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('faculty_dashboard/', views.faculty_dashboard, name='faculty_dashboard'),
    path('student_dashboard/', views.student_dashboard, name='student_dashboard'),
    path('edit_attendance/', views.edit_attendance, name='edit_attendance'),
    path('reporting/', views.reporting_dashboard, name='reporting_dashboard'),
    path('daywise/', views.daywise_attendance_view, name='daywise_attendance'),

    



 
   
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)