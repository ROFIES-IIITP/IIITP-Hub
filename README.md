# 🎓 IIITP Hub 🚀  

A **self-hosted** local network hub designed for students of our college, providing seamless access to essential resources, media, and system management tools.  

>**NOTE:** Admin guidelines can be [here](./admin-guidelines.md)

## 🌐 Overview  
IIITP Hub runs **exclusively on the college WiFi/LAN**, ensuring a **secure and fast** experience. It features a **role-based access system**, where students can browse study materials and media, while admins have extended control over services.  

## 🏠 Landing Page (Heimdall)  
- **Students** 🎓 – View study materials, media server, and maintainers of the server  
- **Admin** 🔧 – Access system management tools, Manage Docker containers and other server settings  

## 📌 Key Services  
- 📚 **E-Lib** – Year-wise study materials, past papers, and ISO files  
- 🎬 **Media Server (Jellyfin)** – Movies & series streaming  
- 📁 **Network Attached Storage (FileBrowser)** – Read-only file access for students (downloading is enabled), full control for admins  
- 📊 **System Monitor (Cockpit)** – Live monitoring & control for admins  
- 🐳 **Docker Management (Portainer)** – Containerized service control  
- 🔗 **Contributors Section** – Direct links to student's portfolio  

## 👥 Role-Based Access  
| Service           | Student 🎓 | Admin 🔧 |  
|------------------|-----------|----------|  
| 📚 **E-Lib**     | ✅ Access  | ✅ Manage  |  
| 🎬 **Media**     | ✅ Access  | ✅ Manage  |  
| 📁 **NAS**       | 👁️ Read-Only | ✅ Full Control |  
| 📊 **Monitor**   | ❌ No Access | ✅ Full Control |  
| 🐳 **Docker**    | ❌ No Access | ✅ Manage |  
| 🏠 **Heimdall**  | 🔒 Limited | 🔑 Admin Mode |  



## 🚀 Usage  

1. **Ensure Local Network Connection**  
   - Connect to the **college/hostel WiFi** to access the server.  

2. **Server IP**  
   - For now, the server IP is `192.168.16.93` 

3. **Access the Dashboard (Heimdall)**  
   - Open a web browser and enter the server IP.  
   - Students can browse available resources. 

4. **Using E-Lib** 📚  
   - Navigate to the **E-Library** section.  
   - Browse or download study materials.  

5. **Streaming from Media Server (Jellyfin)** 🎬  
   - Open **Jellyfin** and log in with provided credentials.  
   - Browse or download available movies & series.   

6. **Contributors Section** 🔗  
   - Students can view and access contributor portfolios. 


## 🎯 Future Plans  
- ✅ **Minecraft Server** 🎮  
- ✅ **Locally Hosted AI Models** 🤖  

IIITP Hub is **built for efficiency**—fast, secure, and tailored for the campus network. 🏫⚡  
