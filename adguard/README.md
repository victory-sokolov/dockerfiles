# Adguard Home blocks ADS on DNS level

Reference: https://github.com/AdguardTeam/AdGuardHome

## Set up

1. Create docker volumes

```bash
docker volume create adguard_data
docker volume create adguard_config
```

2. Install Adguard Home with a Docker Run command

```bash
docker run --name adguardhome
    --restart unless-stopped
    -v adguard_data:/opt/adguardhome/work
    -v adguard_config:/opt/adguardhome/conf
    -p 53:53/tcp -p 53:53/udp
    -p 80:80/tcp -p 443:443/tcp -p 443:443/udp -p 3000:3000/tcp
    -d adguard/adguardhome
```

3. Visit URL to access the ADGuard dashboard. http://YOUR_DOCKER_IP:3000
Get Docker Ip address with `ip a`
