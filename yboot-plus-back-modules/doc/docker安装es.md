
1. 下载镜像：`docker pull elasticsearch:6.5.3`

2. 运行容器：`docker run -d -p 9200:9200 -p 9300:9300 --name elasticsearch-6.5.3 elasticsearch:6.5.3`

3. 进入容器：`docker exec -it elasticsearch-6.5.3 /bin/bash` 

4. 安装 ik 分词器：`./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.5.3/elasticsearch-analysis-ik-6.5.3.zip`

5. 修改 es 配置文件：`vi ./config/elasticsearch.yml

   ```yaml
   cluster.name: "docker-cluster"
   network.host: 0.0.0.0
   
   # minimum_master_nodes need to be explicitly set when bound on a public IP
   # set to 1 to allow single node clusters
   # Details: https://github.com/elastic/elasticsearch/pull/17288
   discovery.zen.minimum_master_nodes: 1
   
   # just for elasticsearch-head plugin
   http.cors.enabled: true
   http.cors.allow-origin: "*"
   ```

6. 退出容器：`exit`

7. 停止容器：`docker stop elasticsearch-6.5.3`

8. 启动容器：`docker start elasticsearch-6.5.3`
