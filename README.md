# Playbook說明

Playbook                               | Description
:--------------------------------------|:------------------------
apigee-prepare.yml                     | 安裝前準備
apigee-import-ca.yml                   | 匯入ca憑證
apigee-build-planet.yml                | 安裝apigee
apigee-build-sso.yml                   | 安裝apigee-sso
apigee-build-edgeui.yml                | 安裝apigee new edgeui ui
apigee-rmp-tls12.yml                   | rmp tls 設定
apigee-devportal-tls.yml               | devportal tls 設定
apigee-devportal-tls-ms.yml            | devportal MGMT_URL 設定
apigee-ui-tls.yml                      | classic edge ui tls 設定
apigee-ui-port.yml                     | classic edge ui port 設定
apigee-edgeui-tls.yml                  | new edge ui tls 設定
apigee-sso-change-entityid.yml         | 修改apigee-sso entityid
apigee-rmp-to-disk.yml                 | 分析資料存到硬碟
apigee-jmx.yml                         | 開啟jmx
apigee-zk-jmx.yml                      | 開啟zookeeper jmx
apigee-monit.yml                       | 安裝apigee monit
apigee-start.yml                       | 開啟apigee
apigee-stop.yml                        | 關閉apigee
apigee-build-mirror.yml                | 建立安裝來源鏡像
apigee-monit-report.yml                | apigee monit report
apigee-postgres-replication-check.yml  | 檢查postgres replication
apigee-postgres-failover.yml           | 切換postgres
apigee-postgres-replication-resync.yml | 重新同步postgres replication


# env.yml 參數說明

Var                              | Value                      | Description
:--------------------------------|:------------------------|:------------------------
apigee_release	                 | 4.50.00	               | apigee 版本
apigee_repository_protocol	     | https://	               | 安裝來源協定
apigee_repository_address	     | software.apigee.com	   | 安裝來源位置
apigee_repository_base_path	     | /	                   | 安裝來源基礎路徑
apigee_repository_username	     | admin	               | 安裝來源帳號
apigee_repository_password	     | password	               | 安裝來源密碼
apigee_analytics_retention_days	 | 180	                   | 分析數據保留天數
apigee_virtual_host_port	     | 9001	                   | apigee gateway port
apigee_virtual_host_aliases	     | apigateway	           | apigee gateway FQDN
apigee_license_path	             | license/license.txt	   | license檔案位置
apigee_topology                  | - dc-1 ms-ld-ds-0 ms,ds<br> - dc-1 rmp-qs-0 rmp,qs<br> - dc-1 ps-master ps<br> - dc-1 devportal dp | apigee 角色拓撲 
apigee_admin_email	             | admin@apigee.com	       | apigee admin 帳號
apigee_admin_password	         | Apigee11	               | apigee admin 密碼
apigee_organization_name	     | apigee	               | 組織名稱
apigee_environment_name	         | dev	                   | 環境名稱
apigee_keystore_password		 | Apigee11                | keystore密碼
apigee_keystore_keyalias	     | apigee	               | keystore 別名
apigee_keystore_src	             | ssl/keystore.jks	       | keystore 檔案位置
apigee_ssl_key_src	             | ssl/server.key	       | ssl key 檔案位置
apigee_ssl_crt_src	             | ssl/server.crt	       | ssl cert 檔案位置
apigee_sso_saml_idp_metadata_url | IDP MEDDATA URL         | saml metadata 檔案位置
apigee_public_postgresql_host	 | ps-master               | postgres FQDN
apigee_sso_entityid		         | SP ENTITYID             | apigee sso entityid
apigee_sso_public_url_hostname	 | edgeui	               | apigee sso FQDN
apigee_smtp_host		         | SMTP HOST               | smtp 位置
apigee_smtp_port	             | 25	                   | smtp port
apigee_smtp_user		         | SMTP USER               | smtp 帳號
apigee_smtp_password		     | SMTP PASSWORD           | smtp 密碼
apigee_smtp_ssl	                 | False	               | smtp 是否啟用ssl
apigee_smtp_mail_from		     | SMTP MAIL FROM          | 寄件人email


# inventory.ini 說明

Group                   | Description
:-----------------------|:---------------------------------------
apigee	                | 安裝 apigee component <br> apigee_msip: 設定連接 management server
apigee_sso	            | 安裝 apigee sso <br> apigee_msip: 設定連接 management server
apigee_edgeui	        | 安裝 apigee new edge ui <br> apigee_msip: 設定連接 management server



# 使用說明

ansible-playbook -i inventory/inventory.ini apigee-prepare.yml -e @inventory/env.yml