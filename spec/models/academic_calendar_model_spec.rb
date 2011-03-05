require 'spec_helper'

#
# Note: to check future dates, use the following code. Date.new(2010, 8, 23).cweek
#
  

describe AcademicCalendar do

  context 'current semester' do
    it 'should respond to current_semester' do
      AcademicCalendar.should respond_to :current_semester
    end

    it 'should return Fall in the Fall' do
       Date.stub!(:today).and_return(Date.new(2010, 9, 1))
       AcademicCalendar.current_semester.should == "Fall"
    end
    it 'should return Spring in the Spring' do
       Date.stub!(:today).and_return(Date.new(2011, 3, 1))
       AcademicCalendar.current_semester.should == "Spring"
    end
    it 'should return Summer in the Summer' do
       Date.stub!(:today).and_return(Date.new(2010, 7, 1))
       AcademicCalendar.current_semester.should == "Summer"
    end
  end

  context 'semester start' do
    it 'should respond to semester_start' do
      AcademicCalendar.should respond_to :semester_start
    end


    it 'should know the academic year 2011-2012' do
      AcademicCalendar.semester_start("Fall", 2011).should == 35
#      AcademicCalendar.semester_start("Spring", 2012).should == 2
#      AcademicCalendar.semester_start("Summer", 2012).should == 20
    end

    it 'should know the academic year 2010-2011' do
      AcademicCalendar.semester_start("Fall", 2010).should == 34
      AcademicCalendar.semester_start("Spring", 2011).should == 2
      AcademicCalendar.semester_start("Summer", 2011).should == 20
    end


  # For the academic year 2008-2009, here are the start dates of each semester
  # Fall, 8/25/08 which is cweek 35, (Orientation is 34)
  # Spring, 1/12/09 which is cweek 3, (Gathering is 2)
  # Summer, 5/18/09 which is cweek 21, (Gathering is 20)
    it 'should know the academic year 2008-2009' do
      AcademicCalendar.semester_start("Fall", 2008).should == 35
      AcademicCalendar.semester_start("Spring", 2009).should == 3
      AcademicCalendar.semester_start("Summer", 2009).should == 21
    end

  #
  # For the academic year 2009-2010, here are the start dates of each semester
  # Fall, 8/24/09 which is cweek 34, (Orienation is 33)
  # Spring, 1/11/10 which is cweek 2, (Gathering is 1)
  # Summer, 5/17/10 which is cweek 20, (Gathering is 19)
    it 'should know the academic year 2009-2010' do
      AcademicCalendar.semester_start("Fall", 2009).should == 34
      AcademicCalendar.semester_start("Spring", 2010).should == 2
      AcademicCalendar.semester_start("Summer", 2010).should == 20
    end


  end



end