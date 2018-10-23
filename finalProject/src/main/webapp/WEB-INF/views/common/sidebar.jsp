      
      <%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
      <div class="navbar nav_title" style="border: 0;" >
         <a href="#" class="site_title"><img src="${contextPath }/resources/images/DBDBDEP.png" width="200px" height="50px"></a>
      </div>
      <div class="clearfix"></div>
      
      <!-- menu prile quick info -->
      <div class="profile">
         <div class="profile_pic">
            <img src="${contextPath }/resources/uploadFiles/${ sessionScope.loginUser.modiFileName }" alt="..." class="img-circle profile_img">
         </div>
         <div class="profile_info">
            <span> 환영합니다 </span>

            <h2>${loginUser.empName } 님</h2>
            

         </div>
      </div>
      <!-- /menu prile quick info -->
      <br />
      <!-- sidebar menu -->
      <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
         <div class="menu_section">
            <h3>${loginUser.jobName }</h3>
            <ul class="nav side-menu">
               <li>
                  <a><i class="fa fa-user"></i> 마이페이지 <span
                     class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                     <li><a href="myInfo.me">개인 정보 수정</a></li>
                     <li><a href="mySalary.me?var=${loginUser.empNo }">급여 내역 조회</a></li>
                     <li><a href="myJobRank.me?var=${loginUser.empNo }">직급 변경 이력 조회</a></li>
                     <li><a href="myDepartment.me?var=${loginUser.empId }">부서이동 이력 조회</a></li>
                     <li><a href="myJobPosition.me?var=${loginUser.empNo }">직책 변경 이력 조회</a></li>
                     <li><a href="myWorkingHours.me?var=${loginUser.empNo }">근태 이력 조회</a></li>
                     <li><a href="myVacation.me?var=${loginUser.empNo }">휴가 내역 조회</a></li>
                     <li><a href="${ contextPath }/qrInsert.ms">QR출석</a><li>
                     <script type="text/javascript">
                     
                     </script>
                  </ul>
               </li>
               
               <li>
                  <a><i class="fa fa-newspaper-o"></i> 전자결재 <span   class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                     <li><a href="signWrite.sg">문서 기안</a></li>
                     <li><a href="signImWriter.sg?empNo=${loginUser.empNo }">기안함</a></li>
                     <li><a href="signApprovalList.sg?empNo=${loginUser.empNo }">결재 대기함</a></li>
                     <li><a href="signComplete.sg?empNo=${loginUser.empNo }">결재 완료함</a></li>
                     <li><a href="signReceive.sg?empNo=${loginUser.empNo }">수신함</a></li>
                  </ul>
               </li>
               
               <li>
                  <a><i class="fa fa-video-camera"></i> 화상회의 
                     <span class="fa fa-chevron-down"></span>
                  </a>
                  <ul class="nav child_menu" style="display: none">
                     <li><a href="rtcMain.rtc">화상회의 하기</a></li>
                     <li><a href="selectProceeding.rtc?empNo=${loginUser.empNo }">회의록 보기</a></li>
                  </ul>
               </li>
               <li>
                  <a><i class="fa fa-calendar"></i> 일정
                     <span class="fa fa-chevron-down"></span>
                  </a>
                  <ul class="nav child_menu" style="display: none">
                     <li><a href="calendarMy.ca">내 일정</a></li>
                     <li><a href="calendarDep.ca">부서 일정</a></li>
                  </ul>
               </li>
               <li><a href="boardList.bo?depName=${sessionScope.loginUser.depName}"><i class="fa fa-clipboard"></i> 부서게시판 </a></li>
               
               <li><a href="${ contextPath }/depESelect.de?loginUser=${sessionScope.loginUser.empNo}"><i class="fa fa-clipboard"></i> 비상연락망</a></li>
               <!-- <li><a href="calendar.ca"><i class="fa fa-calendar"></i> 일정 관리 </a></li> -->
               
               <li><a href="addressBook.ad"><i class="fa fa-star"></i> 주소록 </a></li>
				
               <li><a href="salary.me"><i class="fa fa-won"></i> 회계관리 </a></li>

               <li>
               <a><i class="fa fa-users"></i> 인사관리 <span
                     class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                     <li><a href="moveMemberInsert.me">사원 추가</a></li>
                     <li><a href="depMgt.pm">부서근태현황</a></li>                                                  
                     <li><a href="promotion.pm">문서승인</a></li>
                     <li><a href="depVacation.pm">부서별 휴가자 조회</a></li>
                     <li><a href="depPromotion.pm">부서별 진급자 조회</a></li>
                     <li><a href="depleave.pm">부서별 퇴사자 조회</a></li>
                     <li><a href="depmoveDeptRecord.pm">부서이동이력 조회</a></li>
                  </ul>             
               </li>

              
            </ul>

         </div>
      </div>
      <!-- /sidebar menu -->
      </div>
      </div>
      <!-- top navigation -->
      <div class="top_nav">

        <div class="nav_menu">
          <nav class="" role="navigation">
            <div class="nav toggle">
              <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
            

            <ul class="nav navbar-nav navbar-right">
            <li><a href="logout.me""><i class="fa fa-power-off"></i> LogOut </a></li>
              <li role="presentation" class="dropdown">
                <a onclick="return test(${loginUser.empNo });" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                  <i class="fa fa-envelope-o" style="font-size:25px;"></i>
                  <span class="badge bg-green">${loginUser.myAlarmCount }</span>
                </a>
                <ul id="menu1" class="dropdown-menu list-unstyled msg_list animated fadeInDown" role="menu">
                </ul>
              </li>
               

            </ul>
          </nav>
        </div>

      </div>
      
      <script>
      $(function(){
    	var empNo = empNo;
  		console.log(empNo);
  		
  		$.ajax({
  			type : "post",
  			url : "alarm.me",
  			data : {empNo:empNo},
  			dataType : "json",
  			success : function(data) {
  				console.log(data);
  				console.log(typeof data);
  				
  				$("#menu1").html('');
  				
  				var list = data;
  				
  				var str = '';
  				$.each(list, function(i){
  					
  					str += '<li style=""><a href="deleteAlarm.me?alarmNo=' + list[i].alarmNo+'" style="font-size:15px;"><b style="font-size:12px;">발신자 : ' + list[i].empName + '</b><br>' + list[i].alarmContents + '</a>';
  					str += '</li>';
  				});
  				
  				str += '<li><div class="text-center"><a href="${ contextPath }/facingReceiveList.ms?loginUser=${loginUser.empNo }"><strong data-toggle="modal" data-target="">쪽지함 보기</strong><i class="fa fa-angle-right"></i></a></div></li>';
  				
  				$("#menu1").append(str);
  				/* $("#alarmMessage").html('');
  				
  				var list = data;
  				$.each(data, function(index, item){
  					console.log(item.alarmContents);
  					$("#alarmMessage").text(item.alarmContents);
  				}); */
  				
  			},
  			error : function(data) {
  				console.log(data);
  			}
  		});
      });
    		
    	
      
      	function test(empNo){
      		var empNo = empNo;
      		console.log(empNo);
      		
      		$.ajax({
      			type : "post",
      			url : "alarm.me",
      			data : {empNo:empNo},
      			dataType : "json",
      			success : function(data) {
      				console.log(data);
      				console.log(typeof data);
      				
      				$("#menu1").html('');
      				
      				var list = data;
      				
      				var str = '';
      				$.each(list, function(i){
      					
      					str += '<li style=""><a href="deleteAlarm.me?alarmNo=' + list[i].alarmNo+'" style="font-size:15px;"><b style="font-size:12px;">발신자 : ' + list[i].empName + '</b><br>' + list[i].alarmContents + '</a>';
      					str += '</li>';
      				});
      				
      				str += '<li><div class="text-center"><a href="${ contextPath }/facingReceiveList.ms?loginUser=${loginUser.empNo }"><strong data-toggle="modal" data-target="">쪽지함 보기</strong><i class="fa fa-angle-right"></i></a></div></li>';
      				
      				$("#menu1").append(str);
      				/* $("#alarmMessage").html('');
      				
      				var list = data;
      				$.each(data, function(index, item){
      					console.log(item.alarmContents);
      					$("#alarmMessage").text(item.alarmContents);
      				}); */
      				
      			/* },
      			error : function(data) {
      				console.log(data);
      			}
      		});
      	}
      </script>
      
      
      <!-- 메세지 -->
      	<!-- Modal -->
											<div class="modal fade" id="myModal" role="dialog">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">쪽지함</h4>
														</div>
														<div class="modal-body">
															
															<div class="x_panel">
                <div class="x_title">
                  <h2><i class="fa fa-bars"></i> 쪽지함 <small>Float left</small></h2>
            
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                      <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">쪽지보내기</a>
                      </li>
                      <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">보낸쪽지함</a>
                      </li>
                      <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">받은쪽지함</a>
                      </li>
                   <!--    <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">휴지통</a>
                      </li> -->
                      
                    </ul>
                    <div id="myTabContent" class="tab-content">
                      <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                        
                        <div class="col-md-18 col-sm-18 col-xs-18">
              			<div class="x_panel">
                
                        <p>
						
						<!-- 부서 -->
						<label for="heard">부서</label>
                        <select id="heard" class="form-control" required>
                          <option value="">인사과</option>
                     	  <option value="">총무과</option>
                          <option value="">영업부</option>
                     
                        </select>
						<br>
						<!-- 사원명 -->
                        <label for="heard">사원</label>
                        <select id="heard" class="form-control" required>
                          <option value="">Choose..</option>
                          <option value="press">Press</option>
                          <option value="net">Internet</option>
                          <option value="mouth">Word of mouth</option>
                        </select>
						
						<br><br>
						
                        <label for="message">Message (20 chars min, 100 max) :</label>
                        <textarea id="message" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                          data-parsley-validation-threshold="10"></textarea>

                        <br/>
                        <button class="btn btn-primary">보내기</button>

						</p>
					  </div>
					  </div>
                      </div>
                      
                      
            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                      				
	         <div class="col-md-18 col-sm-18 col-xs-18">
              <div class="x_panel">
                <div class="x_title">
                  <h2>보낸쪽지함 <small>Users</small></h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a href="#"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a href="#"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="card-box table-responsive">
                        <p class="text-muted font-13 m-b-30">
                        </p>

                        <table id="datatable-keytable" class="table table-striped table-bordered">
                          <thead>
                            <tr>
                              <th>보낸사람</th>
                              <th>제목</th>
                              <th>받은날짜</th>
                              <th>삭제</th>
                        
                            </tr>
                          </thead>

					
                          <tbody>
                            <tr>
                              <td>$</td>
                              <td>Integration Specialist</td>
                              <td>New York</td>
                              <td><button class="btn btn-round btn-default">삭제하기</button></td>
                           
                            </tr>
                          
                           
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>

                </div>
                </div>
                </div>
                      <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                       <p>보낸쪽지함입니다.</p>
                       <div class="col-md-18 col-sm-18 col-xs-18">
              <div class="x_panel">
                <div class="x_title">
                  <h2>받은쪽지함 <small>Users</small></h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a href="#"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a href="#"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="card-box table-responsive">
                        <p class="text-muted font-13 m-b-30">
                        </p>

                        <table id="datatable-keytable" class="table table-striped table-bordered">
                          <thead>
                            <tr>
            				  <th>보낸사람</th>
                              <th>제목</th>
                              <th>받은날짜</th>
                              <th>삭제</th>
                            </tr>
                          </thead>


                          <tbody>
                            <tr>
                              <td>Brielle Williamson</td>
                              <td>Integration Specialist</td>
                              <td>New York</td>
                              <td><button class="btn btn-round btn-default">삭제하기</button></td>
                            </tr>
                          
                           
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>

                </div>
                </div>
                      </div>
      
                      </div>
                    </div>
                  </div>
															
															
															
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
      
      
      <!-- /top navigation -->