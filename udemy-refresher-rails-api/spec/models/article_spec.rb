require "rails_helper"

RSpec.describe Article, type: :model do
  describe "#validations" do
    let(:article) { build(:article) }

    it "has a valid factory" do
      expect(article).to be_valid
    end

    it "is invalid without title" do
      article = build(:article, title: "")

      expect(article).to be_invalid
      expect(article.errors).to have_key(:title)
    end

    it "is invalid without content" do
      article = build(:article, content: "")

      expect(article).to be_invalid
      expect(article.errors).to have_key(:content)
    end

    it "is invalid without slug" do
      article = build(:article, slug: "")

      expect(article).to be_invalid
      expect(article.errors).to have_key(:slug)
    end

    it "is invalid with duplicated slug" do
      article1 = create(:article)
      article2 = build(:article, slug: article1.slug)

      expect(article2).to be_invalid
      expect(article2.errors).to have_key(:slug)
    end
  end

  describe ".recent" do
    it "returns articles in the correct order" do
      older_article  = create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)

      expect(described_class.recent).to eq(
        [recent_article, older_article]
      )

      recent_article.update_column(:created_at, 2.hours.ago)

      expect(described_class.recent).to eq(
        [older_article, recent_article]
      )
    end
  end
end
