module AdminHelper

  def org_percentile
    (num_of_scores_below / num_of_scores) * 100
  end

  def num_of_scores
    @all_org_counts.count
  end

  def num_of_scores_below
    below_counter = count_org_if { |row| row[:org_count] < @organics_count }
  end

  def num_scores_eq_to
    eq_count = count_org_if { |row| row[:org_count] == @organics_count }
  end

  def count_org_if(&block)
    counter = 0
    @all_org_counts.each do |row|
      counter += 1 if row[:id] != current_retailer_id && block.call(row)
    end
    counter
  end

end
