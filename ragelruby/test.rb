
# line 1 "test.rl"

# line 9 "test.rl"



# line 9 "test.rb"
class << self
	attr_accessor :_test_actions
	private :_test_actions, :_test_actions=
end
self._test_actions = [
	0, 1, 0, 1, 1, 1, 5, 1, 
	6, 2, 2, 3, 2, 2, 4
]

class << self
	attr_accessor :_test_key_offsets
	private :_test_key_offsets, :_test_key_offsets=
end
self._test_key_offsets = [
	0, 1, 1, 2
]

class << self
	attr_accessor :_test_trans_keys
	private :_test_trans_keys, :_test_trans_keys=
end
self._test_trans_keys = [
	62, 62, 62, 0
]

class << self
	attr_accessor :_test_single_lengths
	private :_test_single_lengths, :_test_single_lengths=
end
self._test_single_lengths = [
	1, 0, 1, 1
]

class << self
	attr_accessor :_test_range_lengths
	private :_test_range_lengths, :_test_range_lengths=
end
self._test_range_lengths = [
	0, 0, 0, 0
]

class << self
	attr_accessor :_test_index_offsets
	private :_test_index_offsets, :_test_index_offsets=
end
self._test_index_offsets = [
	0, 2, 3, 5
]

class << self
	attr_accessor :_test_trans_targs
	private :_test_trans_targs, :_test_trans_targs=
end
self._test_trans_targs = [
	2, 1, 1, 3, 1, 1, 1, 0, 
	0, 0, 0
]

class << self
	attr_accessor :_test_trans_actions
	private :_test_trans_actions, :_test_trans_actions=
end
self._test_trans_actions = [
	0, 12, 12, 0, 12, 9, 12, 7, 
	5, 5, 0
]

class << self
	attr_accessor :_test_to_state_actions
	private :_test_to_state_actions, :_test_to_state_actions=
end
self._test_to_state_actions = [
	1, 0, 0, 0
]

class << self
	attr_accessor :_test_from_state_actions
	private :_test_from_state_actions, :_test_from_state_actions=
end
self._test_from_state_actions = [
	3, 0, 0, 0
]

class << self
	attr_accessor :_test_eof_trans
	private :_test_eof_trans, :_test_eof_trans=
end
self._test_eof_trans = [
	0, 8, 10, 10
]

class << self
	attr_accessor :test_start
end
self.test_start = 0;
class << self
	attr_accessor :test_first_final
end
self.test_first_final = 0;
class << self
	attr_accessor :test_error
end
self.test_error = -1;

class << self
	attr_accessor :test_en_main
end
self.test_en_main = 0;


# line 12 "test.rl"

def run_lexer(data)
  data = data
  eof = data.length

  
# line 127 "test.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = test_start
	ts = nil
	te = nil
	act = 0
end

# line 18 "test.rl"
  
# line 139 "test.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	end
	if _goto_level <= _resume
	_acts = _test_from_state_actions[cs]
	_nacts = _test_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _test_actions[_acts - 1]
			when 1 then
# line 1 "NONE"
		begin
ts = p
		end
# line 169 "test.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _test_key_offsets[cs]
	_trans = _test_index_offsets[cs]
	_klen = _test_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _test_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _test_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _test_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _test_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _test_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	end
	if _goto_level <= _eof_trans
	cs = _test_trans_targs[_trans]
	if _test_trans_actions[_trans] != 0
		_acts = _test_trans_actions[_trans]
		_nacts = _test_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _test_actions[_acts - 1]
when 2 then
# line 1 "NONE"
		begin
te = p+1
		end
when 3 then
# line 5 "test.rl"
		begin
act = 1;		end
when 4 then
# line 6 "test.rl"
		begin
act = 2;		end
when 5 then
# line 6 "test.rl"
		begin
te = p
p = p - 1; begin  puts "any: #{data[ts...te]}"  end
		end
when 6 then
# line 1 "NONE"
		begin
	case act
	when 1 then
	begin begin p = ((te))-1; end
 puts '>>>' end
	when 2 then
	begin begin p = ((te))-1; end
 puts "any: #{data[ts...te]}" end
end 
			end
# line 266 "test.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _test_to_state_actions[cs]
	_nacts = _test_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _test_actions[_acts - 1]
when 0 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 286 "test.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _test_eof_trans[cs] > 0
		_trans = _test_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 19 "test.rl"
end


run_lexer("asdf")
run_lexer(">>>")
