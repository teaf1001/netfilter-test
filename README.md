# netfilter-test

------------------------------
[iptable 초기화 및 룰 설정]

sudo iptables -F

sudo iptables -A OUTPUT -j NFQUEUE --queue-num 0

sudo iptables -A INPUT -j NFQUEUE --queue-num 0


------------------------------
[정상 사이트 접근]
- 입력: sudo ./nfqnl_test gilgil.net
- 접속 방법: firefox 브라우저에서 test.gilgil.net 접속
<br>
[출력 결과 예시]
![image](https://user-images.githubusercontent.com/60030828/130336832-92500fa6-787f-44c7-914b-b3e8967f39d0.png)


------------------------------
[악성 사이트 접근] 
- 입력: sudo ./nfqnl_test gilgil.net
- 접속 방법: firefox 브라우저에서 gilgil.net 접속
- You Visit Malicous Page: [패킷 raw data에서 가져온 request host uri]


<br>
[출력 결과 예시]
![image](https://user-images.githubusercontent.com/60030828/130336818-655e77e6-c4c1-4fe8-86d5-7d2c39844dcc.png)


------------------------------
[HTTP 요청 패킷이 아닌 경우]
- 예: IP 계층 혹은 전송 계층 패킷 혹은 HTTP가 아닌 응용계층 패킷
    
    - IP 계층 혹은 전송 계층 패킷 -> 악성 조건이 될 수 없기 때문에(응용 계층 페이로드가 없음) 전부 ACCEPT
    - HTTP가 아닌 응용계층 패킷   -> 'GET /'을 찾을 수 없기 때문에 전부 ACCEPT
<br>
[출력 결과 예시]

![image](https://user-images.githubusercontent.com/60030828/130336692-dc22d04f-8ccc-4712-bf3a-25eeec710793.png)

