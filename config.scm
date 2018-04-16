(use-modules (gnu) (gnu system nss) (gnu packages display-managers))    
(use-service-modules desktop networking)
(use-package-modules xfce gnome certs)

(operating-system  
  (bootloader (grub-configuration (target "/dev/sda")
                                  (theme (grub-theme))))
      
(file-systems (cons* (file-system
                      (device "root")
                      (mount-point "/")
                      (type "ext4"))
                     (file-system 
                      (device "home")
                      (mount-point "/home")
                      (type "ext4"))
                     %base-file-systems)))
      
(host-name "j2rm")
(timezone "America/Caracas")
(locale "es_VE.UTF-8")
      
(users (cons (user-account                
               (name "j2rm")
               (comment "jorge")
               (group "users")
               (supplementary-groups '("wheel" "netdev"
                                       "audio" "video"))
               (home-directory "/home/j2rm"))))
      
(packages (cons* xfce
                 nss-certs
                 gvfs 
                 slim  
                %base-packages))  
      
(services (cons* (dhcp-client-service) 
                %base-services)) 
      
(services (cons* (xfce-desktop-service)   
                %desktop-services))  
      

(name-service-switch %mdns-host-lookup-nss))
           
