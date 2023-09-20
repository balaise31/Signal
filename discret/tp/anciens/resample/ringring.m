function self = ringring(N=16, C=1)
	self.in_buff = zeros(N,C);
	self.out_buff = zeros(N,C);
	self.N=N;
	self.C=C;
	self.position = 1;
	self.out_position = 1;
	
	self.set_position = @(self, position=1) set_position(self, position);
	self.set_in_buff= @(self, s) set_in(self,s);
	self.get_in_buff= @(self, L=1) get_in(self,L);
	self.feed_out= @(self, val) feed_out(self,val);
	
end	

function self = set_position(self, position)
	self.position= position ;
end	

function self = feed_out(self, val)
	self.out_buff(self.out_position,:)=val;
	self.out_position = self.out_position +1;
end	

function self = set_in(self,s)
	self.in_buff(self.position:self.position+length(s)-1,:)=s;
end	

function vals = get_in(self, L)
	vals = [	self.in_buff((self.N +self.position-L+1):self.N,:) ;
				self.in_buff(max(1,self.position-L+1):self.position,:)
			];
end	