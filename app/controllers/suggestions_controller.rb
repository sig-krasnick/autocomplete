class SuggestionsController < ApplicationController
  def index
    # This should ONLY render the HTML page, no JSON logic
    render :index
  end

  def autocomplete
    # This handles the JSON API requests
    prefix = params[:prefix]
    limit = params[:limit]&.to_i || 8

    if prefix.present? && prefix.length >= 2
      suggestions = $trie.autocomplete(prefix, limit)
      render json: { suggestions: suggestions }
    else
      render json: { suggestions: [] }
    end
  end

  def stats
    render json: { 
      word_count: $trie.word_count,
      total_words: $trie.total_words
    }
  end
end