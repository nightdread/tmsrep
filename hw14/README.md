# 1.Run container from ubuntu image
#### a. Login to this container
#### b. Create file /sizefile with size 1GB
#### c. Check docker container size(RW layer and virtual size)
#### d. Delete container
![Picture](https://github.com/nightdread/tmsrep/blob/hw14/hw14/2021-03-23_14-20-12.png)

# 2. Create your own image hw14 based on ubuntu image
#### a. For this use Dockerfile
#### b. Add file /sizefile with size =1GB to Dockerfile
#### c. Run container from hw14 images
#### d. Check docker container size(RW layer and virtual size)
#### e. Push your image to your docker hub account(create if account does not exist)
![Picture](https://github.com/nightdread/tmsrep/blob/hw14/hw14/2021-03-23_15-05-16.png)

![Picture](https://github.com/nightdread/tmsrep/blob/hw14/hw14/2021-03-23_15-16-34.png)

# 3.Run containers from ubuntu image
#### a.With first mount use bind mount
![Picture](https://github.com/nightdread/tmsrep/blob/hw14/hw14/2021-04-02_15-31-47.png)
#### b.With second run use volume mount
![Picture](https://github.com/nightdread/tmsrep/blob/hw14/hw14/2021-04-02_15-39-10.png)
![Picture](https://github.com/nightdread/tmsrep/blob/hw14/hw14/2021-04-02_15-40-01.png)

# 4.Run nginx container from nginx image.
#### a.Map 8081 port to 80 port of nginx container. Check it
![Picture](https://github.com/nightdread/tmsrep/blob/hw14/hw14/2021-04-02_16-01-38.png)
#### b.Do not use a particular port and get any random port mapped to 80 port of your nginx container.
![Picture](https://github.com/nightdread/tmsrep/blob/hw14/hw14/2021-04-02_16-02-32.png)