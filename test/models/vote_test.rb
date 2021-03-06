require "test_helper"

describe Vote do

  before do
    @vote1 = votes(:vote1)
    @vote2 = votes(:vote2)
  end




  it "must be valid when a vote is made" do
    is_valid = @vote1.valid?
    expect( is_valid ).must_equal true
  end



  it "must not be valid when a vote is made for the same user for the same work" do

    # vote = Vote.new(work_id: work.id, user_id: @logged_in_user.id)

    repeat_vote = Vote.new(user_id: @vote1.user.id, work_id: @vote1.work.id)
    repeat_vote.save

    is_valid = repeat_vote.valid?
    expect( is_valid ).must_equal false
  end


  it "It allows 2 different users to vote for the same work" do
    @vote3 = votes(:vote3)

    same_work_vote = Vote.new(user_id: @vote1.user.id, work_id: @vote3.work.id)
    same_work_vote.save

    is_valid = same_work_vote.valid?
    expect( is_valid ).must_equal true
  end


  #testing the realtionship that Vote has a user which has a user_id.
  it "A vote has a user_id" do
    @vote1.user_id == @vote1.user.id
    expect(@vote1.user_id == @vote1.user.id
    ).must_equal true
  end

  #testing the realtionship that a Vote has a Work which has work_id.
  it "A vote has a work_id" do
    expect(@vote1.work_id == @vote1.work.id).must_equal true
  end


  it "It returns the work with most votes" do
    vote = Vote.where(work_id: @vote1.work)

    expect(vote.length).must_equal 3

  end




end
