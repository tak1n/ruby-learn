class A
end

class B < A
end

obj = B.new

p obj.class
p B.class
p A.class

p B.ancestors
p A.ancestors

p obj.singleton_class
p B.singleton_class
p A.singleton_class

p obj.singleton_class.ancestors
p B.singleton_class.ancestors
p A.singleton_class.ancestors


=begin

|  .... superclass
-> .... singletonclass
*  .... real class (eg.: obj is instance of B, A is instance of Class)

                             -------
                            *|Class|
                             -------
                                |
        -------------     --------------
        |BasicObject|*  ->|#BasicObject|*
        -------------     --------------
              |                 |
           --------         ---------
           |Object|*    ->  |#Object|*
           --------         ---------
              |                 |
           -------           ------
           |  A  |*     ->   | #A |*
           -------           ------
              |                 |
           -------           ------
          *|  B  |*     ->   | #B |*
           -------           ------
              |
-------    --------
| obj |* ->| #obj |
-------    --------

=end
