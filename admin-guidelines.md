# 🛠️ IIITP Hub - Admin Guidelines

## 🔐 Admin Access
The **Admin Panel** allows privileged users to manage and maintain the IIITP Hub. This includes handling user access, managing services, and performing system monitoring tasks.

### 📌 Prerequisites
Before proceeding, ensure:
- You are **connected** to the college network (IIITP WiFi).
- You have the **admin credentials** for accessing Portainer, Cockpit, and Heimdall.
- Some of the Setup Scripts are present in **Root Directory** of this repository. Either you can run those scripts, or manually install tools as shown in this page.
---

## 🚀 Essential Admin Tasks

### 🛜 1. Assign a Static IP to the Server
To assign a static IP to your server, contact the `Network Admin` of our college. Ask them to link a **fairly easy to remember** IP address like `192.168.16.100`, with the **MAC address** of the server. 

```sh
ifconfig -a
```
You can get the MAC address by using `ifconfig` (mostly named as `ether` in the appropriate interface)

### 🖥️ 2. Accessing the Server
To connect via SSH:
```bash
ssh <username>@<server-ip>
```

### 🐳 3. Install Docker & Portainer

Docker allows us to run applications in isolated environments (containers), and Portainer provides a web-based UI to manage them easily.

Run the following commands to install and enable docker. Ensure Docker starts on boot and is currently running
```bash
sudo nala install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
```


### 🏗️ 4. Install & Setup Portainer

Portainer provides a simple way to manage Docker containers via a web UI.

Run the following command to deploy Portainer:
```sh
docker volume create portainer_data

docker run -d \
  --name=portainer \
  --restart=always \
  -p 9000:9000 \
  -p 8000:8000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce
```

#### 🔑 Access Portainer
Once the container is running, open `http://<server-ip>:9000` in a web browser.

Set up an admin password and select `Manage local Docker environment`

### 📦 5. Deploying a Container in Portainer
Portainer makes it easy to set up and manage containers. Follow these steps to deploy a new container:

#### 🖥️ Access Portainer
1. Open `http://<server-ip>:9000`in a web browser.
2. Log in with your admin credentials.
3. Select `Local` to manage the Docker instance running on the server.
4. Open `Containers` 

#### 🚀 Deploy a New Container
1. Go to Containers → Click `Add Container`
   
2. Enter a name for your container.
   
3. In the Image field, enter the Docker image name (e.g., nginx:latest). If the image is not downloaded, Portainer will pull it automatically.
   
4. Port Mapping:
   
    - Click `Map additional port`, then:
        - Enter the container port (e.g., 80).
        - Enter the host port (e.g., 8080).
       
5. Under `Advanced container settings`:
   
   - **Volumes**:
       - Click `Map additional volume`, then:
            - Select `Bind`
            - In Container path, enter the path inside the container (e.g., /config).
            - In Host path, enter the path on the server (e.g., /opt/appdata/nginx).

    - **Network**:
        - Leave it as bridge unless a custom network is required.
    - **Restart Policy**
      - Set it to `Always`

6. Click `Deploy the container`.


### ⚙️ 6. Setting Up Heimdall (Dashboard)

Heimdall serves as the **default landing page** for students and admins, providing quick access to various services.

#### 🚀 Deploy Heimdall in Portainer
Follow **Step-5** with the inputs given below

| **INPUT** | **VALUE** |
| ----- | ----- |
| Container Name | heimdall |
| Image | linuxserver/heimdall:latest |
| Port Mapping | Container Port: `80` → Host Port: `80` |
| Volumes | `/config` → `/opt/appdata/heimdall` |
| Restart Policy | Always |

#### 🛠️ Configure Heimdall
1. Open `http://<server-ip>` in a browser.
2. Set up the admin password to restrict modifications.
3. Add student-accessible shortcuts (e.g., e-Lib, Media Server).
4. Add admin-only shortcuts (e.g., Portainer, Cockpit).

### 📂 7. Setting Up File Browser (NAS)
To provide a simple web-based file management system:

1. Deploy File Browser in Portainer
   
Use the following settings while creating the container:

| **INPUT** | **VALUE** |
| ----- | ----- |
| Container Name | filebrowser |
| Image | filebrowser/filebrowser |
| Port Mapping | `8080`:`80` |
| Volumes | `/config` → `/mnt/nas/config`<br>`/srv` -> `/mnt/nas/media` |
| Restart Policy | Always |

2. Accessing File Browser

Open a web browser and go to `http://<server-ip>:8080`

Default Credentials:
- Username: admin
- Password: admin (Change this immediately!)

3. Configure User Roles
   - Go to Settings > Users
   - Create: 
  - Admin users (Full access)
  - Student users (Read-only access)

>💡 Tip: Students can only download files, while admins can upload and manage them.

### 🎬 7. Setting Up Media Server (Jellyfin)
To host and stream movies and series within the network:
1. Deploy Jellyfin in Portainer
   
| **INPUT** | **VALUE** |
| ----- | ----- |
| Container Name | jellyfin |
| Image | jellyfin/jellyfin |
| Port Mapping | `8096`:`8096` |
| Volumes | `/media` → `/mnt/nas/media`<br>`/cache` → `/mnt/nas/jellyfin/cache` <br> `/config`→ `/mnt/nas/jellyfin/config` |
| Restart Policy | Always |

2. Accessing Jellyfin

- Open a web browser and go to `http://<server-ip>:8096`
- First-Time Setup:
    - Choose a language
    - Create an admin account
    - Add your media folders (/media)
    - Set up user(student) access

>💡 Tip: Admins can organize media, while students can watch or download content directly.


### 🖥️ 9. Setting Up System Monitor (Cockpit)
Cockpit provides a web-based interface for managing the server.

1. Install Cockpit
   ```sh
   sudo nala update
   sudo nala install cockpit-y
   sudo systemctl enable --now cockpit.socket
   ```  
2. Accessing Cockpit

  - Open a web browser and go to `http://<server-ip>:9090`
  - Log in using admin credentials

>💡 Tip: Use Cockpit to monitor system resources, manage services, and view logs in real time.