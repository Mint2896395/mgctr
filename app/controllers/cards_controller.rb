class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    #@cards = Card.all.order(:id)
    if params[:person_id]
      @person = Person.find(params[:person_id])
      @cards = @person.cards.order(:id).page params[:page]
    else
      @cards = Card.all.order(:id).page params[:page]
    end 
    
    @deck = [
  { :id => 0, :name => "The Fool", :image =>  "/mycard0.jpg", :desc => "Immaturity, sincerity, the natural man, a free spirit. One who naturally knows his will and is worry free. A dreamer, careless and disinterested in practical matters. Travel." , :rdesc => "Folly, failure, madness. Hindered travel." },
  { :id => 1, :name => "The Magician", :image =>  "/mycard1.jpg" , :desc => "Will, creativeness, adroitness, mastery, elasticity, autonomy, eloquence, craft, cunning. May imply a new beginning. The Magus is an autonomous person that knows where he is going and how to achieve its ends." , :rdesc => "Indecision, weak will, ineptitude, dilettante. Deceitfulness, trickery." },
  { :id => 2, :name => "The High Priestess", :image =>  "/mycard2.jpg" , :desc => "Hidden influence. Silence, patience, equilibrium. Slow but firm. Pondered decision. Advice, tuition, possibly given by a woman. Psychic ability. The manifestation of the eternal feminine in a spiritual way." , :rdesc => "Deceptive, secret, or sly manner. Lazyness, intolerance. Delays. False ideas, moodiness, doubt, superficiality." },
  { :id => 3, :name => "The Empress", :image =>  "/mycard3.jpg" , :desc => "Understanding, charm, kindness, beauty, pleasure, success, safety, trust. Nurturing, positive development." , :rdesc => "False appearance, vanity, disdain, frivolity. Sterility. Delays. Careless spending." },
  { :id => 4, :name => "The Emperor", :image =>  "/mycard4.jpg" , :desc => "Stability. Power. Being in control of yourself/situation. Ambition. Leadership. Firmness of purpose. A dominant male person." , :rdesc => "Loss of control. Emotional immaturity and bondage to parents. Possibility of being defrauded of one's inheritance. Ill-temper. Stubbornness. Fall. Loss of wealth. Megalomaniac." },
  { :id => 5, :name => "The Hierophant", :image =>  "/mycard5.jpg" , :desc => "Wisdom, endurance, persistence, patience, help from superiors, good advice, a good teacher, organization, peace, goodness of heart. The card that represents you, in the form of your own, truest voice, your own inner-self. Dogma. Can be lawyers." , :rdesc => "Tendency to over criticize or being unduly concerned with the morals of others. Incapable of dealing efficiently with practical matters, especially finances. Unconventionality, illogical, superstitious, unable to behave coherently." },
  { :id => 6, :name => "The Lovers", :image =>  "/mycard6.jpg" , :desc => "Union, decision, choice, marriage, love, the union of opposites, attraction. Balance, openness to inspiration. Harmony of the inner and outer aspect of life." , :rdesc => "Disorder, failure, danger of a broken relationship or a wrong choice, quarrels, infidelity. Emotional instability. Dangerous temptation." },
  { :id => 7, :name => "The Chariot", :image =>  "/mycard7.jpg" , :desc => "Triumph of the will, to surmount opposition, success. Self-control, ability to determinate the own destiny. Good news. Great physical and mental strength. Swiftness. The transitory power. Travel." , :rdesc => "Generalized disorder. Illness. Dangerous restlessness. Danger of a violent accidente." },
  { :id => 8, :name => "Justice", :image =>  "/mycard8.jpg" , :desc => "Conformity to moral rightness in action or attitude. The power to maintain equilibrium between the necessities and responsibilities of life. Justice, balance, adjustment. In order to keep things balanced certain things must be sacrificed.. May refer to law matters, trials, marriages, divorces, etc. Integrity, moderation." , :rdesc => "Fanaticism, injustice, inequality, legal complications. Harsh judgment. Insecurity, imbalance." },
  { :id => 9, :name => "The Hermit", :image =>  "/mycard9.jpg" , :desc => "Prudence, wisdom, patience, silence, spiritual advance, divine inspiration, circumspection, retirement from participation in current events, solitude. Pilgrimage. Quest for wisdom. Could be a teacher. A period of spiritual and intellectual personal development." , :rdesc => "Immaturity, viciousness, darkness, stubbornness, deception, betrayal, too much or insufficient prudence. Misanthrope, misogyny, celibacy, excessively shy person. Hidden enemies." },
  { :id => 10, :name => "The Wheel of Fortune", :image =>  "/mycard10.jpg" , :desc => "Change, evolution, success, good fortune, fate. Happiness, abundance. New conditions." , :rdesc => "Retarded progress. Delays, setbacks." },
  { :id => 11, :name => "Strength", :image =>  "/mycard11.jpg" , :desc => "Sublimation or regulation of the passions and lower instincts. Power, energy, great love. Spirit ruling over matter. Action, courage. Success. Powerful will and great physical strength. The inner strength to tame the lust." , :rdesc => "Discord, ruin, stubbornness, abuse of power. Weakness." },
  { :id => 12, :name => "The Hanged Man", :image =>  "/mycard12.jpg" , :desc => "Fortitude, wisdom. Self-imposed limitations. Voluntary sacrifice leading to new insight or initiation through tribulations and ordeals. Redemption through sacrifice, loss. Prophetic power. Suspended decisions. Choice requiring contemplation." , :rdesc => "Arrogance, egotism, resistance to spiritual influences. Absorption in physical matters. Wasted effort. False prophecy. Failure." },
  { :id => 13, :name => "Death", :image =>  "/mycard13.jpg" , :desc => "Complete transformation. Death and rebirth. The end of something. Evolution from one state to another." , :rdesc => "Stagnation, death, petrification. Incurable ill person. Broken marriage." },
  { :id => 14, :name => "Temperance", :image =>  "/mycard14.jpg" , :desc => "Careful consideration, patience, moderation, adaptation, tempering, self-control. To temper, to combine, to exercise self-restraint. Patience, bringing together two opposites carefully blending them. Good marriage. Working in harmony with others, good management. Something is brewing. Great talent and creative involvement. Striving for Transcendence through works. Alchemy. The union of opposites refined by the fire of the Will." , :rdesc => "Disorder, conflict, unfortunate combinations, quarrels. Possibility of shipwreck." },
  { :id => 15, :name => "The Devil", :image =>  "/mycard15.jpg" , :desc => "Fate (wrong or good). Seductive power, blind impulse. Temptation, obsession. Sexual deviation. A disturbed mental state. Earthly passions are turning you inside and out." , :rdesc => "Harmful, fate, wrong use of force, weakness, blindness, disorder. Malefic effects. The pathetic human condition of choosing illusion over truth." },
  { :id => 16, :name => "The Blasted Tower", :image =>  "/mycard16.jpg" , :desc => "Sudden changes without choice, collapse, escape from prison or bondages, accident. Plans will fall, intentions will break down. Finger of God. Bankruptcy. Sudden death." , :rdesc => "Complete confusion. The gain of freedom at great cost. False accusations, oppression." },
  { :id => 17, :name => "The Star", :image =>  "/mycard17.jpg" , :desc => "Hope, unexpected help, insight and clarity of vision, inspiration, flexibility. Great love will be given and received. Good health." , :rdesc => "Arrogance, pessimism, stubbornness. Illness. Error of judgment." },
  { :id => 18, :name => "The Moon", :image =>  "/mycard18.jpg" , :desc => "Intuition, threshold of an important change, arduous and obscure path, development of psychic powers." , :rdesc => "Unforeseen perils, secret foes, hallucination, self-deception, hysteria, disorientation. Blackmailer." },
  { :id => 19, :name => "The Sun", :image =>  "/mycard19.jpg" , :desc => "Glory. Material happiness. Happy marriage or relationship, collaboration. Success. Pleasure. Energy, motivation, inspiration to others." , :rdesc => "Anoyances, disguise. Arrogance. Broken engagement or lost job." },
  { :id => 20, :name => "Judgement", :image =>  "/mycard20.jpg" , :desc => "Radical change, resurrection to a new life. A work (or life) well done. Willingness to try something new. Good judgment and discernment. Creative power and influence over family and career. Forgiveness. Awakening. Legal judgments, in one's favor." , :rdesc => "Spiritual vacillation, weakness, wrong judgment. Illness. Separation. Adverse legal judgment." },
  { :id => 21, :name => "The World", :image =>  "/mycard21.jpg" , :desc => "Success granted. Rewards. Travel, emigration, change of residence." , :rdesc => "Hindrances, stagnation. Hard work to bring success." },
  { :id => 22, :name => "Ace of Wands", :image =>  "/mycard22.jpg" , :desc => "Creation, birth. The power or ability to begin or to follow through energetically with a plan or task; enterprise and determination. Beginning of an enterprise, invention or adventure." , :rdesc => "Fall. To lose or postpone something (employment, enterprise, etc.). False starts." },
  { :id => 23, :name => "Two of Wands", :image =>  "/mycard23.jpg" , :desc => "Dominion. Maturity. Boldness with self-control. Influence." , :rdesc => "Disturbance. Indifferent to or disregardful of consequences. Fear, illness." },
  { :id => 24, :name => "Three of Wands", :image =>  "/mycard24.jpg" , :desc => "Virtue. Established strength, realization of hope, nobility. Cooperation, partnership." , :rdesc => "Inconsistency, deception, treachery. Loss, robbery." },
  { :id => 25, :name => "Four of Wands", :image =>  "/mycard25.jpg" , :desc => "Completion. Settlement, peace, harmony. Romance, marriage, society." , :rdesc => "Insecurity. Uneasiness, unreliableness. Contradictions, incomplete happiness." },
  { :id => 26, :name => "Five of Wands", :image =>  "/mycard26.jpg" , :desc => "Strife. Competition, lawsuit, obstacles, violence, fighting." , :rdesc => "Dangerous indecision, treachery, complication." },
  { :id => 27, :name => "Six of Wands", :image =>  "/mycard27.jpg" , :desc => "Victory after strife. Good news. Progress, helping friends." , :rdesc => "Postponement. Insolence, excessive pride. Treason." },
  { :id => 28, :name => "Seven of Wands", :image =>  "/mycard28.jpg" , :desc => "Valor. Victory through courage. Struggle. Fierce competition. Certain success." , :rdesc => "Uncertainty and fear. Pregnancy. False appearance." },
  { :id => 29, :name => "Eight of Wands", :image =>  "/mycard29.jpg" , :desc => "Swiftness. Hasty decision. Air travel, messages. Love letter. Hyperactivity. Great hopes." , :rdesc => "Opposition. Jealousness. Delay in business or love affair." },
  { :id => 30, :name => "Nine of Wands", :image =>  "/mycard30.jpg" , :desc => "Strength. Capability of enduring a long struggle and achieve the final victory. Recovery from sickness." , :rdesc => "Weakness, delays, sickness. Adversity." },
  { :id => 31, :name => "Ten of Wands", :image =>  "/mycard31.jpg" , :desc => "Oppression. Imbalance and selfishness. Heavy burden. Force detached from spiritual sources. A problem may be solved soon." , :rdesc => "Annoyances. Treason. Separation, emigration. Some loses." },
  { :id => 32, :name => "Page of Wands", :image =>  "/mycard32.jpg" , :desc => "Young and brilliant. Enthusiastic and daring. A messenger or bearer of tidings." , :rdesc => "Frivolous youth. Theatrical and shallow. Cruel, oppressive." },
  { :id => 33, :name => "Knight of Wands", :image =>  "/mycard33.jpg" , :desc => "A young and energetic man. Swift and daring. May be noble and generous but also violent and hasty." , :rdesc => "Jealous, weak and intolerant person. Quarrel, discord, frustration." },
  { :id => 34, :name => "Queen of Wands", :image =>  "/mycard34.jpg" , :desc => "Kind, energetic but calm woman. Conservative, pragmatic and authoritarian. Fruitful in mind and body." , :rdesc => "Domineering, jealous, dogmatic and irrational. Quick to take offense." },
  { :id => 35, :name => "King of Wands", :image =>  "/mycard35.jpg" , :desc => "Courageous, swift and generous man. Passionate and strong. Paternalistic and proud. May be a country gentleman, generally married. Unexpected heritage; a good marriage." , :rdesc => "Despotic, bigoted, prejudiced, evil-minded." },
  { :id => 36, :name => "Ace of Cups", :image =>  "/mycard36.jpg" , :desc => "Harmony, fertility, happiness, beginning of great love." , :rdesc => "Discord, false love, instability." },
  { :id => 37, :name => "Two of Cups", :image =>  "/mycard37.jpg" , :desc => "Love. Harmony, warm friendship. Close relation with a kindred soul. Good for business and love." , :rdesc => "Opposition. False love. Folly, misunderstanding." },
  { :id => 38, :name => "Three of Cups", :image =>  "/mycard38.jpg" , :desc => "Abundance. Pleasure, hospitality, success. The good things of life." , :rdesc => "Sensuality or food and drink intemperance." },
  { :id => 39, :name => "Four of Cups", :image =>  "/mycard39.jpg" , :desc => "Luxury. Abandonment to desire. New ambition." , :rdesc => "Luxury that does not provide happiness. Dissatisfaction with material success. Turning point in life." },
  { :id => 40, :name => "Five of Cups", :image =>  "/mycard40.jpg" , :desc => "Disappointment. Unexpected misfortune. Partial loss. Friendship or love gone. Inheritance." , :rdesc => "New happiness. Return of an old friend or love. Alliance." },
  { :id => 41, :name => "Six of Cups", :image =>  "/mycard41.jpg" , :desc => "Pleasure. Happiness coming from the past. Nostalgia. Success." , :rdesc => "Uncertainty. Living too much in the past. Worthless associates. Inheritance." },
  { :id => 42, :name => "Seven of Cups", :image =>  "/mycard42.jpg" , :desc => "Debauch. Foolish expectations. Illusory dreams, deceit. Intoxication. Drug addiction." , :rdesc => "New will. Intelligent decision. Short travels." },
  { :id => 43, :name => "Eight of Cups", :image =>  "/mycard43.jpg" , :desc => "Indolence. Instability. Material success abandoned, may be for something higher. Decline in interest. Wandering." , :rdesc => "Joy, happiness. A new love or interest in material things.." },
  { :id => 44, :name => "Nine of Cups", :image =>  "/mycard44.jpg" , :desc => "Happiness. Complete material success and well-being. You will get what you wish." , :rdesc => "Imperfection, deceit. Intemperance. You will not get what you wish." },
  { :id => 45, :name => "Ten of Cups", :image =>  "/mycard45.jpg" , :desc => "Satiety. Perfect love and lasting contentment. Peace, friendship." , :rdesc => "Dissipation, loss of friendship. Betrayal. Waste." },
  { :id => 46, :name => "Page of Cups", :image =>  "/mycard46.jpg" , :desc => "Quiet and studious youth, but also sweet and dreamy. News or proposition." , :rdesc => "A sensual libertine, not harmful but neither helpful. Unpleasant news. Flatterer, selfish." },
  { :id => 47, :name => "Knight of Cups", :image =>  "/mycard47.jpg" , :desc => "A young man may be an artist, who is graceful and poetic. He is an indolent dreamer of sensual pleasures. Can mean a messenger, a proposition or an invitation." , :rdesc => "Lazy and deceitful. A dissolute and merciless person." },
  { :id => 48, :name => "Queen of Cups", :image =>  "/mycard48.jpg" , :desc => "Dreamy, calm, poetic, imaginative, kind yet not willing to take much trouble for another." , :rdesc => "Dishonest and vicious woman, not to be trusted." },
  { :id => 49, :name => "King of Cups", :image =>  "/mycard49.jpg" , :desc => "A man skilled in law or trade and interested in science, art, religion or philosophy. A good friend, liberal, idealistic and creative. Kind and willing to take some responsibility." , :rdesc => "A superficial man, easily enthusiastic, but with little depth of character. Untruthful, ruthless and vicious." },
  { :id => 50, :name => "Ace of Swords", :image =>  "/mycard50.jpg" , :desc => "Conquest. Triumph through trouble. Intense activity. Gestation or parturition." , :rdesc => "Disaster or conquest followed by disaster. Great loss. Violent death. Infertility." },
  { :id => 51, :name => "Two of Swords", :image =>  "/mycard51.jpg" , :desc => "Peace. Balanced forces. Indecision. Strength. Friendship." , :rdesc => "Disloyalty. Change, sometimes in the wrong direction. Quarrel" },
  { :id => 52, :name => "Three of Swords", :image =>  "/mycard52.jpg" , :desc => "Sorrow. Separation, quarrel, tears. Delay. Absence." , :rdesc => "Confusion, loss, error." },
  { :id => 53, :name => "Four of Swords", :image =>  "/mycard53.jpg" , :desc => "Truce. Solitude. Stagnation. Recovering from illness. Exile. Retreat." , :rdesc => "Renewed activity. Surprise. Prudence and economy are advised." },
  { :id => 54, :name => "Five of Swords", :image =>  "/mycard54.jpg" , :desc => "Defeat. Failure. Loss. Powerlessness. Separation. Lies. Death." , :rdesc => "Risk of loss or defeat. Funeral. Weakness." },
  { :id => 55, :name => "Six of Swords", :image =>  "/mycard55.jpg" , :desc => "Science. Journey by water, revelation, study. Intelligent effort. Success after anxiety." , :rdesc => "Stagnation. Unfavorable result. Intellectual pride." },
  { :id => 56, :name => "Seven of Swords", :image =>  "/mycard56.jpg" , :desc => "Futility. Partial or unpredictable result. Dreams, vacillation. Travel by land." , :rdesc => "Quarrels. Slanders. Disenchantment in family or friendship." },
  { :id => 57, :name => "Eight of Swords", :image =>  "/mycard57.jpg" , :desc => "Interference. Restriction. Temporal sickness or captivity. Indecision." , :rdesc => "New beginnings. Freedom from the past bondages." },
  { :id => 58, :name => "Nine of Swords", :image =>  "/mycard58.jpg" , :desc => "Cruelty. Suffering. Misery. Sickness. Martyrdom. Burden. May be death of a loved one." , :rdesc => "Patience, faithfulness, unselfishness." },
  { :id => 59, :name => "Ten of Swords", :image =>  "/mycard59.jpg" , :desc => "Ruin. Total defeat. Death. The end of an illusion." , :rdesc => "Transitory success. Improvement." },
  { :id => 60, :name => "Page of Swords", :image =>  "/mycard60.jpg" , :desc => "Logic and penetrating young man or woman. Mentally and physically dexterous. Spying. Messages." , :rdesc => "Frivolous, revengeful and cunning. Indiscretion. Impotence. Unforeseen perturbation." },
  { :id => 61, :name => "Knight of Swords", :image =>  "/mycard61.jpg" , :desc => "Audacious, clever and gallant; spirited young man. He may be domineering and unstable but he has the better intentions." , :rdesc => "Harsh, fanatic, extravagant. Tyranic and aggressive. Dangerous enemy." },
  { :id => 62, :name => "Queen of Swords", :image =>  "/mycard62.jpg" , :desc => "A graceful but stern woman. She has keen insight and good judgment. May be a dancer, a widow or a childless woman. This card also means privation and mourning." , :rdesc => "Playfully mischievous. Dangerous enemy. Jealous and narrow-minded woman." },
  { :id => 63, :name => "King of Swords", :image =>  "/mycard63.jpg" , :desc => "This man may be a very good ally or counselor. He is clever and self-controlled and has some authority. Also is modern, analytical and very strong. The card may also mean a lawsuit." , :rdesc => "Deceitful and malicious man. He may be a dangerous enemy, violent and powerful." },
  { :id => 64, :name => "Ace of Pentacles", :image =>  "/mycard64.jpg" , :desc => "The beginning of prosperity and wealth. Pleasure and beauty." , :rdesc => "Success is delayed or it does not give happiness. Greed." },
  { :id => 65, :name => "Two of Pentacles", :image =>  "/mycard65.jpg" , :desc => "Change. Alternation of gain and loss. Equilibrium in the midst of change. Ability to adapt to new circumstances. Some complications. Unstable mood." , :rdesc => "Uncertainty. Difficulty adapting to new circumstances." },
  { :id => 66, :name => "Three of Pentacles", :image =>  "/mycard66.jpg" , :desc => "Works. Task well done. Commercial transactions. Professional growth. Dignity. A male child." , :rdesc => "Unsufficient skill or knowledge to achieve the goal. Fruitless work. Lack of seriousness." },
  { :id => 67, :name => "Four of Pentacles", :image =>  "/mycard67.jpg" , :desc => "Power. Purely material gain and security. A gift or an inheritance. A female child. Greed." , :rdesc => "Prejudice. Limitation. Sudden check in progress or loss. Reckeless spending of money." },
  { :id => 68, :name => "Five of Pentacles", :image =>  "/mycard68.jpg" , :desc => "Worry. Loss of money or employment. Poverty. Defeat. Lovers. Sympathy found in the midst of trouble." , :rdesc => "New employment or opportunity. Productive work. Misfortune in love." },
  { :id => 69, :name => "Six of Pentacles", :image =>  "/mycard69.jpg" , :desc => "Success. Material gain and power. Sharing with others the wealth." , :rdesc => "Transitory gains. Prodigality. Bribery. Purse proud." },
  { :id => 70, :name => "Seven of Pentacles", :image =>  "/mycard70.jpg" , :desc => "Failure. Defeat. Loss of money. Hard work but little gain. Greedy." , :rdesc => "Delayed success after hard work. Work done for the love of work without expecting retribution." },
  { :id => 71, :name => "Eight of Pentacles", :image =>  "/mycard71.jpg" , :desc => "Prudence. The first steps of a profitable profession. Learning a business or profession. Ability in material affairs. A brunette." , :rdesc => "Greedy. Selfish in a petty way. Vanity." },
  { :id => 72, :name => "Nine of Pentacles", :image =>  "/mycard72.jpg" , :desc => "Gain. Practical wisdom limited to everyday affairs and the home. Stability. Solitude. Inheritance." , :rdesc => "Loss of friendship or a material thing. Cancelled project. Beware of knavery." },
  { :id => 73, :name => "Ten of Pentacles", :image =>  "/mycard73.jpg" , :desc => "Wealth. Fulfillment of material fortune. Family matters. Inheritance. House." , :rdesc => "Family misfortune. Loss of inheritance. Beware of risky projects." },
  { :id => 74, :name => "Page of Pentacles", :image =>  "/mycard74.jpg" , :desc => "A learned young person, careful and reflective. Good management, kind and benevolent. The bearer of good news and messages." , :rdesc => "Wasteful, illogical, rebellious youth. Bad news or lost of money." },
  { :id => 75, :name => "Knight of Pentacles", :image =>  "/mycard75.jpg" , :desc => "Mature and responsible, a trustworthy and laborious man. A capable manager. An important matter concerning money." , :rdesc => "Dull, lazy or clumsy man. Careless. Stagnation." },
  { :id => 76, :name => "Queen of Pentacles", :image =>  "/mycard76.jpg" , :desc => "Charming and generous woman. Pragmatic and quiet, but ambitious. Opulence, security." , :rdesc => "Foolish and temperamental. Prone to suspicion ad fearful of failure. Negligent." },
  { :id => 77, :name => "King of Pentacles", :image =>  "/mycard77.jpg" , :desc => "A married man, wealthy and clever in money matters. Patient and laborious, he is an experimented chief and a reliable ally." , :rdesc => "Vicious and greedy man. Beware or gamblers or speculators. Easy to bribe, he may be a dangerous man." },
  ]
  end

  def special


    if params[:person_id]
      @person = Person.find(params[:person_id])
      @cards = @person.cards.order(:id).page params[:page]
      @cardsc = @person.cards.order(:person_id)
      @cardsc2 = @person.cards.order(:person_id)
      @cardsc_x = @person.cards.order(:person_id).page params[:page]
      @cards1 = @person.cards.order(:id)
      @cards2 = @person.cards.order(:id)

    else
      @cards = Card.all.order(:id).page params[:page]
      @cardsc = Card.all.order(:person_id)
      @cardsc_x = Card.all.order(:person_id).page params[:page]
      @cards1 = Card.all.order(:id) 
      @cards2 = Card.all.order(:id) 
      if params[:q]
        #@cards1 = Card.where("card01 ILIKE ? OR card02 ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").all.order('LOWER(name)')
        @cards1 = Card.where("card01 ILIKE ? OR card02 ILIKE ?", "#{params[:q]}", "#{params[:q]}").all.order('LOWER(name)')
      else
        @cards1 = Card.all.order(:id) 
      end
    
      if params[:all]
        @cards = @cards.per(Card.count)
        @cardsc = Card.all.order(:person_id)
        @cards1 = Card.all.order(:id)
        @cards2 = Card.all.order(:id)
      end
    end 
    
    @deck = [
  { :id => 0, :name => "The Fool", :image =>  "/mycard0.jpg", :desc => "Immaturity, sincerity, the natural man, a free spirit. One who naturally knows his will and is worry free. A dreamer, careless and disinterested in practical matters. Travel." , :rdesc => "Folly, failure, madness. Hindered travel." },
  { :id => 1, :name => "The Magician", :image =>  "/mycard1.jpg" , :desc => "Will, creativeness, adroitness, mastery, elasticity, autonomy, eloquence, craft, cunning. May imply a new beginning. The Magus is an autonomous person that knows where he is going and how to achieve its ends." , :rdesc => "Indecision, weak will, ineptitude, dilettante. Deceitfulness, trickery." },
  { :id => 2, :name => "The High Priestess", :image =>  "/mycard2.jpg" , :desc => "Hidden influence. Silence, patience, equilibrium. Slow but firm. Pondered decision. Advice, tuition, possibly given by a woman. Psychic ability. The manifestation of the eternal feminine in a spiritual way." , :rdesc => "Deceptive, secret, or sly manner. Lazyness, intolerance. Delays. False ideas, moodiness, doubt, superficiality." },
  { :id => 3, :name => "The Empress", :image =>  "/mycard3.jpg" , :desc => "Understanding, charm, kindness, beauty, pleasure, success, safety, trust. Nurturing, positive development." , :rdesc => "False appearance, vanity, disdain, frivolity. Sterility. Delays. Careless spending." },
  { :id => 4, :name => "The Emperor", :image =>  "/mycard4.jpg" , :desc => "Stability. Power. Being in control of yourself/situation. Ambition. Leadership. Firmness of purpose. A dominant male person." , :rdesc => "Loss of control. Emotional immaturity and bondage to parents. Possibility of being defrauded of one's inheritance. Ill-temper. Stubbornness. Fall. Loss of wealth. Megalomaniac." },
  { :id => 5, :name => "The Hierophant", :image =>  "/mycard5.jpg" , :desc => "Wisdom, endurance, persistence, patience, help from superiors, good advice, a good teacher, organization, peace, goodness of heart. The card that represents you, in the form of your own, truest voice, your own inner-self. Dogma. Can be lawyers." , :rdesc => "Tendency to over criticize or being unduly concerned with the morals of others. Incapable of dealing efficiently with practical matters, especially finances. Unconventionality, illogical, superstitious, unable to behave coherently." },
  { :id => 6, :name => "The Lovers", :image =>  "/mycard6.jpg" , :desc => "Union, decision, choice, marriage, love, the union of opposites, attraction. Balance, openness to inspiration. Harmony of the inner and outer aspect of life." , :rdesc => "Disorder, failure, danger of a broken relationship or a wrong choice, quarrels, infidelity. Emotional instability. Dangerous temptation." },
  { :id => 7, :name => "The Chariot", :image =>  "/mycard7.jpg" , :desc => "Triumph of the will, to surmount opposition, success. Self-control, ability to determinate the own destiny. Good news. Great physical and mental strength. Swiftness. The transitory power. Travel." , :rdesc => "Generalized disorder. Illness. Dangerous restlessness. Danger of a violent accidente." },
  { :id => 8, :name => "Justice", :image =>  "/mycard8.jpg" , :desc => "Conformity to moral rightness in action or attitude. The power to maintain equilibrium between the necessities and responsibilities of life. Justice, balance, adjustment. In order to keep things balanced certain things must be sacrificed.. May refer to law matters, trials, marriages, divorces, etc. Integrity, moderation." , :rdesc => "Fanaticism, injustice, inequality, legal complications. Harsh judgment. Insecurity, imbalance." },
  { :id => 9, :name => "The Hermit", :image =>  "/mycard9.jpg" , :desc => "Prudence, wisdom, patience, silence, spiritual advance, divine inspiration, circumspection, retirement from participation in current events, solitude. Pilgrimage. Quest for wisdom. Could be a teacher. A period of spiritual and intellectual personal development." , :rdesc => "Immaturity, viciousness, darkness, stubbornness, deception, betrayal, too much or insufficient prudence. Misanthrope, misogyny, celibacy, excessively shy person. Hidden enemies." },
  { :id => 10, :name => "The Wheel of Fortune", :image =>  "/mycard10.jpg" , :desc => "Change, evolution, success, good fortune, fate. Happiness, abundance. New conditions." , :rdesc => "Retarded progress. Delays, setbacks." },
  { :id => 11, :name => "Strength", :image =>  "/mycard11.jpg" , :desc => "Sublimation or regulation of the passions and lower instincts. Power, energy, great love. Spirit ruling over matter. Action, courage. Success. Powerful will and great physical strength. The inner strength to tame the lust." , :rdesc => "Discord, ruin, stubbornness, abuse of power. Weakness." },
  { :id => 12, :name => "The Hanged Man", :image =>  "/mycard12.jpg" , :desc => "Fortitude, wisdom. Self-imposed limitations. Voluntary sacrifice leading to new insight or initiation through tribulations and ordeals. Redemption through sacrifice, loss. Prophetic power. Suspended decisions. Choice requiring contemplation." , :rdesc => "Arrogance, egotism, resistance to spiritual influences. Absorption in physical matters. Wasted effort. False prophecy. Failure." },
  { :id => 13, :name => "Death", :image =>  "/mycard13.jpg" , :desc => "Complete transformation. Death and rebirth. The end of something. Evolution from one state to another." , :rdesc => "Stagnation, death, petrification. Incurable ill person. Broken marriage." },
  { :id => 14, :name => "Temperance", :image =>  "/mycard14.jpg" , :desc => "Careful consideration, patience, moderation, adaptation, tempering, self-control. To temper, to combine, to exercise self-restraint. Patience, bringing together two opposites carefully blending them. Good marriage. Working in harmony with others, good management. Something is brewing. Great talent and creative involvement. Striving for Transcendence through works. Alchemy. The union of opposites refined by the fire of the Will." , :rdesc => "Disorder, conflict, unfortunate combinations, quarrels. Possibility of shipwreck." },
  { :id => 15, :name => "The Devil", :image =>  "/mycard15.jpg" , :desc => "Fate (wrong or good). Seductive power, blind impulse. Temptation, obsession. Sexual deviation. A disturbed mental state. Earthly passions are turning you inside and out." , :rdesc => "Harmful, fate, wrong use of force, weakness, blindness, disorder. Malefic effects. The pathetic human condition of choosing illusion over truth." },
  { :id => 16, :name => "The Blasted Tower", :image =>  "/mycard16.jpg" , :desc => "Sudden changes without choice, collapse, escape from prison or bondages, accident. Plans will fall, intentions will break down. Finger of God. Bankruptcy. Sudden death." , :rdesc => "Complete confusion. The gain of freedom at great cost. False accusations, oppression." },
  { :id => 17, :name => "The Star", :image =>  "/mycard17.jpg" , :desc => "Hope, unexpected help, insight and clarity of vision, inspiration, flexibility. Great love will be given and received. Good health." , :rdesc => "Arrogance, pessimism, stubbornness. Illness. Error of judgment." },
  { :id => 18, :name => "The Moon", :image =>  "/mycard18.jpg" , :desc => "Intuition, threshold of an important change, arduous and obscure path, development of psychic powers." , :rdesc => "Unforeseen perils, secret foes, hallucination, self-deception, hysteria, disorientation. Blackmailer." },
  { :id => 19, :name => "The Sun", :image =>  "/mycard19.jpg" , :desc => "Glory. Material happiness. Happy marriage or relationship, collaboration. Success. Pleasure. Energy, motivation, inspiration to others." , :rdesc => "Anoyances, disguise. Arrogance. Broken engagement or lost job." },
  { :id => 20, :name => "Judgement", :image =>  "/mycard20.jpg" , :desc => "Radical change, resurrection to a new life. A work (or life) well done. Willingness to try something new. Good judgment and discernment. Creative power and influence over family and career. Forgiveness. Awakening. Legal judgments, in one's favor." , :rdesc => "Spiritual vacillation, weakness, wrong judgment. Illness. Separation. Adverse legal judgment." },
  { :id => 21, :name => "The World", :image =>  "/mycard21.jpg" , :desc => "Success granted. Rewards. Travel, emigration, change of residence." , :rdesc => "Hindrances, stagnation. Hard work to bring success." },
  { :id => 22, :name => "Ace of Wands", :image =>  "/mycard22.jpg" , :desc => "Creation, birth. The power or ability to begin or to follow through energetically with a plan or task; enterprise and determination. Beginning of an enterprise, invention or adventure." , :rdesc => "Fall. To lose or postpone something (employment, enterprise, etc.). False starts." },
  { :id => 23, :name => "Two of Wands", :image =>  "/mycard23.jpg" , :desc => "Dominion. Maturity. Boldness with self-control. Influence." , :rdesc => "Disturbance. Indifferent to or disregardful of consequences. Fear, illness." },
  { :id => 24, :name => "Three of Wands", :image =>  "/mycard24.jpg" , :desc => "Virtue. Established strength, realization of hope, nobility. Cooperation, partnership." , :rdesc => "Inconsistency, deception, treachery. Loss, robbery." },
  { :id => 25, :name => "Four of Wands", :image =>  "/mycard25.jpg" , :desc => "Completion. Settlement, peace, harmony. Romance, marriage, society." , :rdesc => "Insecurity. Uneasiness, unreliableness. Contradictions, incomplete happiness." },
  { :id => 26, :name => "Five of Wands", :image =>  "/mycard26.jpg" , :desc => "Strife. Competition, lawsuit, obstacles, violence, fighting." , :rdesc => "Dangerous indecision, treachery, complication." },
  { :id => 27, :name => "Six of Wands", :image =>  "/mycard27.jpg" , :desc => "Victory after strife. Good news. Progress, helping friends." , :rdesc => "Postponement. Insolence, excessive pride. Treason." },
  { :id => 28, :name => "Seven of Wands", :image =>  "/mycard28.jpg" , :desc => "Valor. Victory through courage. Struggle. Fierce competition. Certain success." , :rdesc => "Uncertainty and fear. Pregnancy. False appearance." },
  { :id => 29, :name => "Eight of Wands", :image =>  "/mycard29.jpg" , :desc => "Swiftness. Hasty decision. Air travel, messages. Love letter. Hyperactivity. Great hopes." , :rdesc => "Opposition. Jealousness. Delay in business or love affair." },
  { :id => 30, :name => "Nine of Wands", :image =>  "/mycard30.jpg" , :desc => "Strength. Capability of enduring a long struggle and achieve the final victory. Recovery from sickness." , :rdesc => "Weakness, delays, sickness. Adversity." },
  { :id => 31, :name => "Ten of Wands", :image =>  "/mycard31.jpg" , :desc => "Oppression. Imbalance and selfishness. Heavy burden. Force detached from spiritual sources. A problem may be solved soon." , :rdesc => "Annoyances. Treason. Separation, emigration. Some loses." },
  { :id => 32, :name => "Page of Wands", :image =>  "/mycard32.jpg" , :desc => "Young and brilliant. Enthusiastic and daring. A messenger or bearer of tidings." , :rdesc => "Frivolous youth. Theatrical and shallow. Cruel, oppressive." },
  { :id => 33, :name => "Knight of Wands", :image =>  "/mycard33.jpg" , :desc => "A young and energetic man. Swift and daring. May be noble and generous but also violent and hasty." , :rdesc => "Jealous, weak and intolerant person. Quarrel, discord, frustration." },
  { :id => 34, :name => "Queen of Wands", :image =>  "/mycard34.jpg" , :desc => "Kind, energetic but calm woman. Conservative, pragmatic and authoritarian. Fruitful in mind and body." , :rdesc => "Domineering, jealous, dogmatic and irrational. Quick to take offense." },
  { :id => 35, :name => "King of Wands", :image =>  "/mycard35.jpg" , :desc => "Courageous, swift and generous man. Passionate and strong. Paternalistic and proud. May be a country gentleman, generally married. Unexpected heritage; a good marriage." , :rdesc => "Despotic, bigoted, prejudiced, evil-minded." },
  { :id => 36, :name => "Ace of Cups", :image =>  "/mycard36.jpg" , :desc => "Harmony, fertility, happiness, beginning of great love." , :rdesc => "Discord, false love, instability." },
  { :id => 37, :name => "Two of Cups", :image =>  "/mycard37.jpg" , :desc => "Love. Harmony, warm friendship. Close relation with a kindred soul. Good for business and love." , :rdesc => "Opposition. False love. Folly, misunderstanding." },
  { :id => 38, :name => "Three of Cups", :image =>  "/mycard38.jpg" , :desc => "Abundance. Pleasure, hospitality, success. The good things of life." , :rdesc => "Sensuality or food and drink intemperance." },
  { :id => 39, :name => "Four of Cups", :image =>  "/mycard39.jpg" , :desc => "Luxury. Abandonment to desire. New ambition." , :rdesc => "Luxury that does not provide happiness. Dissatisfaction with material success. Turning point in life." },
  { :id => 40, :name => "Five of Cups", :image =>  "/mycard40.jpg" , :desc => "Disappointment. Unexpected misfortune. Partial loss. Friendship or love gone. Inheritance." , :rdesc => "New happiness. Return of an old friend or love. Alliance." },
  { :id => 41, :name => "Six of Cups", :image =>  "/mycard41.jpg" , :desc => "Pleasure. Happiness coming from the past. Nostalgia. Success." , :rdesc => "Uncertainty. Living too much in the past. Worthless associates. Inheritance." },
  { :id => 42, :name => "Seven of Cups", :image =>  "/mycard42.jpg" , :desc => "Debauch. Foolish expectations. Illusory dreams, deceit. Intoxication. Drug addiction." , :rdesc => "New will. Intelligent decision. Short travels." },
  { :id => 43, :name => "Eight of Cups", :image =>  "/mycard43.jpg" , :desc => "Indolence. Instability. Material success abandoned, may be for something higher. Decline in interest. Wandering." , :rdesc => "Joy, happiness. A new love or interest in material things.." },
  { :id => 44, :name => "Nine of Cups", :image =>  "/mycard44.jpg" , :desc => "Happiness. Complete material success and well-being. You will get what you wish." , :rdesc => "Imperfection, deceit. Intemperance. You will not get what you wish." },
  { :id => 45, :name => "Ten of Cups", :image =>  "/mycard45.jpg" , :desc => "Satiety. Perfect love and lasting contentment. Peace, friendship." , :rdesc => "Dissipation, loss of friendship. Betrayal. Waste." },
  { :id => 46, :name => "Page of Cups", :image =>  "/mycard46.jpg" , :desc => "Quiet and studious youth, but also sweet and dreamy. News or proposition." , :rdesc => "A sensual libertine, not harmful but neither helpful. Unpleasant news. Flatterer, selfish." },
  { :id => 47, :name => "Knight of Cups", :image =>  "/mycard47.jpg" , :desc => "A young man may be an artist, who is graceful and poetic. He is an indolent dreamer of sensual pleasures. Can mean a messenger, a proposition or an invitation." , :rdesc => "Lazy and deceitful. A dissolute and merciless person." },
  { :id => 48, :name => "Queen of Cups", :image =>  "/mycard48.jpg" , :desc => "Dreamy, calm, poetic, imaginative, kind yet not willing to take much trouble for another." , :rdesc => "Dishonest and vicious woman, not to be trusted." },
  { :id => 49, :name => "King of Cups", :image =>  "/mycard49.jpg" , :desc => "A man skilled in law or trade and interested in science, art, religion or philosophy. A good friend, liberal, idealistic and creative. Kind and willing to take some responsibility." , :rdesc => "A superficial man, easily enthusiastic, but with little depth of character. Untruthful, ruthless and vicious." },
  { :id => 50, :name => "Ace of Swords", :image =>  "/mycard50.jpg" , :desc => "Conquest. Triumph through trouble. Intense activity. Gestation or parturition." , :rdesc => "Disaster or conquest followed by disaster. Great loss. Violent death. Infertility." },
  { :id => 51, :name => "Two of Swords", :image =>  "/mycard51.jpg" , :desc => "Peace. Balanced forces. Indecision. Strength. Friendship." , :rdesc => "Disloyalty. Change, sometimes in the wrong direction. Quarrel" },
  { :id => 52, :name => "Three of Swords", :image =>  "/mycard52.jpg" , :desc => "Sorrow. Separation, quarrel, tears. Delay. Absence." , :rdesc => "Confusion, loss, error." },
  { :id => 53, :name => "Four of Swords", :image =>  "/mycard53.jpg" , :desc => "Truce. Solitude. Stagnation. Recovering from illness. Exile. Retreat." , :rdesc => "Renewed activity. Surprise. Prudence and economy are advised." },
  { :id => 54, :name => "Five of Swords", :image =>  "/mycard54.jpg" , :desc => "Defeat. Failure. Loss. Powerlessness. Separation. Lies. Death." , :rdesc => "Risk of loss or defeat. Funeral. Weakness." },
  { :id => 55, :name => "Six of Swords", :image =>  "/mycard55.jpg" , :desc => "Science. Journey by water, revelation, study. Intelligent effort. Success after anxiety." , :rdesc => "Stagnation. Unfavorable result. Intellectual pride." },
  { :id => 56, :name => "Seven of Swords", :image =>  "/mycard56.jpg" , :desc => "Futility. Partial or unpredictable result. Dreams, vacillation. Travel by land." , :rdesc => "Quarrels. Slanders. Disenchantment in family or friendship." },
  { :id => 57, :name => "Eight of Swords", :image =>  "/mycard57.jpg" , :desc => "Interference. Restriction. Temporal sickness or captivity. Indecision." , :rdesc => "New beginnings. Freedom from the past bondages." },
  { :id => 58, :name => "Nine of Swords", :image =>  "/mycard58.jpg" , :desc => "Cruelty. Suffering. Misery. Sickness. Martyrdom. Burden. May be death of a loved one." , :rdesc => "Patience, faithfulness, unselfishness." },
  { :id => 59, :name => "Ten of Swords", :image =>  "/mycard59.jpg" , :desc => "Ruin. Total defeat. Death. The end of an illusion." , :rdesc => "Transitory success. Improvement." },
  { :id => 60, :name => "Page of Swords", :image =>  "/mycard60.jpg" , :desc => "Logic and penetrating young man or woman. Mentally and physically dexterous. Spying. Messages." , :rdesc => "Frivolous, revengeful and cunning. Indiscretion. Impotence. Unforeseen perturbation." },
  { :id => 61, :name => "Knight of Swords", :image =>  "/mycard61.jpg" , :desc => "Audacious, clever and gallant; spirited young man. He may be domineering and unstable but he has the better intentions." , :rdesc => "Harsh, fanatic, extravagant. Tyranic and aggressive. Dangerous enemy." },
  { :id => 62, :name => "Queen of Swords", :image =>  "/mycard62.jpg" , :desc => "A graceful but stern woman. She has keen insight and good judgment. May be a dancer, a widow or a childless woman. This card also means privation and mourning." , :rdesc => "Playfully mischievous. Dangerous enemy. Jealous and narrow-minded woman." },
  { :id => 63, :name => "King of Swords", :image =>  "/mycard63.jpg" , :desc => "This man may be a very good ally or counselor. He is clever and self-controlled and has some authority. Also is modern, analytical and very strong. The card may also mean a lawsuit." , :rdesc => "Deceitful and malicious man. He may be a dangerous enemy, violent and powerful." },
  { :id => 64, :name => "Ace of Pentacles", :image =>  "/mycard64.jpg" , :desc => "The beginning of prosperity and wealth. Pleasure and beauty." , :rdesc => "Success is delayed or it does not give happiness. Greed." },
  { :id => 65, :name => "Two of Pentacles", :image =>  "/mycard65.jpg" , :desc => "Change. Alternation of gain and loss. Equilibrium in the midst of change. Ability to adapt to new circumstances. Some complications. Unstable mood." , :rdesc => "Uncertainty. Difficulty adapting to new circumstances." },
  { :id => 66, :name => "Three of Pentacles", :image =>  "/mycard66.jpg" , :desc => "Works. Task well done. Commercial transactions. Professional growth. Dignity. A male child." , :rdesc => "Unsufficient skill or knowledge to achieve the goal. Fruitless work. Lack of seriousness." },
  { :id => 67, :name => "Four of Pentacles", :image =>  "/mycard67.jpg" , :desc => "Power. Purely material gain and security. A gift or an inheritance. A female child. Greed." , :rdesc => "Prejudice. Limitation. Sudden check in progress or loss. Reckeless spending of money." },
  { :id => 68, :name => "Five of Pentacles", :image =>  "/mycard68.jpg" , :desc => "Worry. Loss of money or employment. Poverty. Defeat. Lovers. Sympathy found in the midst of trouble." , :rdesc => "New employment or opportunity. Productive work. Misfortune in love." },
  { :id => 69, :name => "Six of Pentacles", :image =>  "/mycard69.jpg" , :desc => "Success. Material gain and power. Sharing with others the wealth." , :rdesc => "Transitory gains. Prodigality. Bribery. Purse proud." },
  { :id => 70, :name => "Seven of Pentacles", :image =>  "/mycard70.jpg" , :desc => "Failure. Defeat. Loss of money. Hard work but little gain. Greedy." , :rdesc => "Delayed success after hard work. Work done for the love of work without expecting retribution." },
  { :id => 71, :name => "Eight of Pentacles", :image =>  "/mycard71.jpg" , :desc => "Prudence. The first steps of a profitable profession. Learning a business or profession. Ability in material affairs. A brunette." , :rdesc => "Greedy. Selfish in a petty way. Vanity." },
  { :id => 72, :name => "Nine of Pentacles", :image =>  "/mycard72.jpg" , :desc => "Gain. Practical wisdom limited to everyday affairs and the home. Stability. Solitude. Inheritance." , :rdesc => "Loss of friendship or a material thing. Cancelled project. Beware of knavery." },
  { :id => 73, :name => "Ten of Pentacles", :image =>  "/mycard73.jpg" , :desc => "Wealth. Fulfillment of material fortune. Family matters. Inheritance. House." , :rdesc => "Family misfortune. Loss of inheritance. Beware of risky projects." },
  { :id => 74, :name => "Page of Pentacles", :image =>  "/mycard74.jpg" , :desc => "A learned young person, careful and reflective. Good management, kind and benevolent. The bearer of good news and messages." , :rdesc => "Wasteful, illogical, rebellious youth. Bad news or lost of money." },
  { :id => 75, :name => "Knight of Pentacles", :image =>  "/mycard75.jpg" , :desc => "Mature and responsible, a trustworthy and laborious man. A capable manager. An important matter concerning money." , :rdesc => "Dull, lazy or clumsy man. Careless. Stagnation." },
  { :id => 76, :name => "Queen of Pentacles", :image =>  "/mycard76.jpg" , :desc => "Charming and generous woman. Pragmatic and quiet, but ambitious. Opulence, security." , :rdesc => "Foolish and temperamental. Prone to suspicion ad fearful of failure. Negligent." },
  { :id => 77, :name => "King of Pentacles", :image =>  "/mycard77.jpg" , :desc => "A married man, wealthy and clever in money matters. Patient and laborious, he is an experimented chief and a reliable ally." , :rdesc => "Vicious and greedy man. Beware or gamblers or speculators. Easy to bribe, he may be a dangerous man." },
  ]
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @cards = Card.all
  end

  # GET /cards/new
  def new
    @card = Card.new
    @deck = [
  { :id => 0, :name => "The Fool", :image =>  "/mycard0.jpg", :desc => "Immaturity, sincerity, the natural man, a free spirit. One who naturally knows his will and is worry free. A dreamer, careless and disinterested in practical matters. Travel." , :rdesc => "Folly, failure, madness. Hindered travel." },
  { :id => 1, :name => "The Magician", :image =>  "/mycard1.jpg" , :desc => "Will, creativeness, adroitness, mastery, elasticity, autonomy, eloquence, craft, cunning. May imply a new beginning. The Magus is an autonomous person that knows where he is going and how to achieve its ends." , :rdesc => "Indecision, weak will, ineptitude, dilettante. Deceitfulness, trickery." },
  { :id => 2, :name => "The High Priestess", :image =>  "/mycard2.jpg" , :desc => "Hidden influence. Silence, patience, equilibrium. Slow but firm. Pondered decision. Advice, tuition, possibly given by a woman. Psychic ability. The manifestation of the eternal feminine in a spiritual way." , :rdesc => "Deceptive, secret, or sly manner. Lazyness, intolerance. Delays. False ideas, moodiness, doubt, superficiality." },
  { :id => 3, :name => "The Empress", :image =>  "/mycard3.jpg" , :desc => "Understanding, charm, kindness, beauty, pleasure, success, safety, trust. Nurturing, positive development." , :rdesc => "False appearance, vanity, disdain, frivolity. Sterility. Delays. Careless spending." },
  { :id => 4, :name => "The Emperor", :image =>  "/mycard4.jpg" , :desc => "Stability. Power. Being in control of yourself/situation. Ambition. Leadership. Firmness of purpose. A dominant male person." , :rdesc => "Loss of control. Emotional immaturity and bondage to parents. Possibility of being defrauded of one's inheritance. Ill-temper. Stubbornness. Fall. Loss of wealth. Megalomaniac." },
  { :id => 5, :name => "The Hierophant", :image =>  "/mycard5.jpg" , :desc => "Wisdom, endurance, persistence, patience, help from superiors, good advice, a good teacher, organization, peace, goodness of heart. The card that represents you, in the form of your own, truest voice, your own inner-self. Dogma. Can be lawyers." , :rdesc => "Tendency to over criticize or being unduly concerned with the morals of others. Incapable of dealing efficiently with practical matters, especially finances. Unconventionality, illogical, superstitious, unable to behave coherently." },
  { :id => 6, :name => "The Lovers", :image =>  "/mycard6.jpg" , :desc => "Union, decision, choice, marriage, love, the union of opposites, attraction. Balance, openness to inspiration. Harmony of the inner and outer aspect of life." , :rdesc => "Disorder, failure, danger of a broken relationship or a wrong choice, quarrels, infidelity. Emotional instability. Dangerous temptation." },
  { :id => 7, :name => "The Chariot", :image =>  "/mycard7.jpg" , :desc => "Triumph of the will, to surmount opposition, success. Self-control, ability to determinate the own destiny. Good news. Great physical and mental strength. Swiftness. The transitory power. Travel." , :rdesc => "Generalized disorder. Illness. Dangerous restlessness. Danger of a violent accidente." },
  { :id => 8, :name => "Justice", :image =>  "/mycard8.jpg" , :desc => "Conformity to moral rightness in action or attitude. The power to maintain equilibrium between the necessities and responsibilities of life. Justice, balance, adjustment. In order to keep things balanced certain things must be sacrificed.. May refer to law matters, trials, marriages, divorces, etc. Integrity, moderation." , :rdesc => "Fanaticism, injustice, inequality, legal complications. Harsh judgment. Insecurity, imbalance." },
  { :id => 9, :name => "The Hermit", :image =>  "/mycard9.jpg" , :desc => "Prudence, wisdom, patience, silence, spiritual advance, divine inspiration, circumspection, retirement from participation in current events, solitude. Pilgrimage. Quest for wisdom. Could be a teacher. A period of spiritual and intellectual personal development." , :rdesc => "Immaturity, viciousness, darkness, stubbornness, deception, betrayal, too much or insufficient prudence. Misanthrope, misogyny, celibacy, excessively shy person. Hidden enemies." },
  { :id => 10, :name => "The Wheel of Fortune", :image =>  "/mycard10.jpg" , :desc => "Change, evolution, success, good fortune, fate. Happiness, abundance. New conditions." , :rdesc => "Retarded progress. Delays, setbacks." },
  { :id => 11, :name => "Strength", :image =>  "/mycard11.jpg" , :desc => "Sublimation or regulation of the passions and lower instincts. Power, energy, great love. Spirit ruling over matter. Action, courage. Success. Powerful will and great physical strength. The inner strength to tame the lust." , :rdesc => "Discord, ruin, stubbornness, abuse of power. Weakness." },
  { :id => 12, :name => "The Hanged Man", :image =>  "/mycard12.jpg" , :desc => "Fortitude, wisdom. Self-imposed limitations. Voluntary sacrifice leading to new insight or initiation through tribulations and ordeals. Redemption through sacrifice, loss. Prophetic power. Suspended decisions. Choice requiring contemplation." , :rdesc => "Arrogance, egotism, resistance to spiritual influences. Absorption in physical matters. Wasted effort. False prophecy. Failure." },
  { :id => 13, :name => "Death", :image =>  "/mycard13.jpg" , :desc => "Complete transformation. Death and rebirth. The end of something. Evolution from one state to another." , :rdesc => "Stagnation, death, petrification. Incurable ill person. Broken marriage." },
  { :id => 14, :name => "Temperance", :image =>  "/mycard14.jpg" , :desc => "Careful consideration, patience, moderation, adaptation, tempering, self-control. To temper, to combine, to exercise self-restraint. Patience, bringing together two opposites carefully blending them. Good marriage. Working in harmony with others, good management. Something is brewing. Great talent and creative involvement. Striving for Transcendence through works. Alchemy. The union of opposites refined by the fire of the Will." , :rdesc => "Disorder, conflict, unfortunate combinations, quarrels. Possibility of shipwreck." },
  { :id => 15, :name => "The Devil", :image =>  "/mycard15.jpg" , :desc => "Fate (wrong or good). Seductive power, blind impulse. Temptation, obsession. Sexual deviation. A disturbed mental state. Earthly passions are turning you inside and out." , :rdesc => "Harmful, fate, wrong use of force, weakness, blindness, disorder. Malefic effects. The pathetic human condition of choosing illusion over truth." },
  { :id => 16, :name => "The Blasted Tower", :image =>  "/mycard16.jpg" , :desc => "Sudden changes without choice, collapse, escape from prison or bondages, accident. Plans will fall, intentions will break down. Finger of God. Bankruptcy. Sudden death." , :rdesc => "Complete confusion. The gain of freedom at great cost. False accusations, oppression." },
  { :id => 17, :name => "The Star", :image =>  "/mycard17.jpg" , :desc => "Hope, unexpected help, insight and clarity of vision, inspiration, flexibility. Great love will be given and received. Good health." , :rdesc => "Arrogance, pessimism, stubbornness. Illness. Error of judgment." },
  { :id => 18, :name => "The Moon", :image =>  "/mycard18.jpg" , :desc => "Intuition, threshold of an important change, arduous and obscure path, development of psychic powers." , :rdesc => "Unforeseen perils, secret foes, hallucination, self-deception, hysteria, disorientation. Blackmailer." },
  { :id => 19, :name => "The Sun", :image =>  "/mycard19.jpg" , :desc => "Glory. Material happiness. Happy marriage or relationship, collaboration. Success. Pleasure. Energy, motivation, inspiration to others." , :rdesc => "Anoyances, disguise. Arrogance. Broken engagement or lost job." },
  { :id => 20, :name => "Judgement", :image =>  "/mycard20.jpg" , :desc => "Radical change, resurrection to a new life. A work (or life) well done. Willingness to try something new. Good judgment and discernment. Creative power and influence over family and career. Forgiveness. Awakening. Legal judgments, in one's favor." , :rdesc => "Spiritual vacillation, weakness, wrong judgment. Illness. Separation. Adverse legal judgment." },
  { :id => 21, :name => "The World", :image =>  "/mycard21.jpg" , :desc => "Success granted. Rewards. Travel, emigration, change of residence." , :rdesc => "Hindrances, stagnation. Hard work to bring success." },
  { :id => 22, :name => "Ace of Wands", :image =>  "/mycard22.jpg" , :desc => "Creation, birth. The power or ability to begin or to follow through energetically with a plan or task; enterprise and determination. Beginning of an enterprise, invention or adventure." , :rdesc => "Fall. To lose or postpone something (employment, enterprise, etc.). False starts." },
  { :id => 23, :name => "Two of Wands", :image =>  "/mycard23.jpg" , :desc => "Dominion. Maturity. Boldness with self-control. Influence." , :rdesc => "Disturbance. Indifferent to or disregardful of consequences. Fear, illness." },
  { :id => 24, :name => "Three of Wands", :image =>  "/mycard24.jpg" , :desc => "Virtue. Established strength, realization of hope, nobility. Cooperation, partnership." , :rdesc => "Inconsistency, deception, treachery. Loss, robbery." },
  { :id => 25, :name => "Four of Wands", :image =>  "/mycard25.jpg" , :desc => "Completion. Settlement, peace, harmony. Romance, marriage, society." , :rdesc => "Insecurity. Uneasiness, unreliableness. Contradictions, incomplete happiness." },
  { :id => 26, :name => "Five of Wands", :image =>  "/mycard26.jpg" , :desc => "Strife. Competition, lawsuit, obstacles, violence, fighting." , :rdesc => "Dangerous indecision, treachery, complication." },
  { :id => 27, :name => "Six of Wands", :image =>  "/mycard27.jpg" , :desc => "Victory after strife. Good news. Progress, helping friends." , :rdesc => "Postponement. Insolence, excessive pride. Treason." },
  { :id => 28, :name => "Seven of Wands", :image =>  "/mycard28.jpg" , :desc => "Valor. Victory through courage. Struggle. Fierce competition. Certain success." , :rdesc => "Uncertainty and fear. Pregnancy. False appearance." },
  { :id => 29, :name => "Eight of Wands", :image =>  "/mycard29.jpg" , :desc => "Swiftness. Hasty decision. Air travel, messages. Love letter. Hyperactivity. Great hopes." , :rdesc => "Opposition. Jealousness. Delay in business or love affair." },
  { :id => 30, :name => "Nine of Wands", :image =>  "/mycard30.jpg" , :desc => "Strength. Capability of enduring a long struggle and achieve the final victory. Recovery from sickness." , :rdesc => "Weakness, delays, sickness. Adversity." },
  { :id => 31, :name => "Ten of Wands", :image =>  "/mycard31.jpg" , :desc => "Oppression. Imbalance and selfishness. Heavy burden. Force detached from spiritual sources. A problem may be solved soon." , :rdesc => "Annoyances. Treason. Separation, emigration. Some loses." },
  { :id => 32, :name => "Page of Wands", :image =>  "/mycard32.jpg" , :desc => "Young and brilliant. Enthusiastic and daring. A messenger or bearer of tidings." , :rdesc => "Frivolous youth. Theatrical and shallow. Cruel, oppressive." },
  { :id => 33, :name => "Knight of Wands", :image =>  "/mycard33.jpg" , :desc => "A young and energetic man. Swift and daring. May be noble and generous but also violent and hasty." , :rdesc => "Jealous, weak and intolerant person. Quarrel, discord, frustration." },
  { :id => 34, :name => "Queen of Wands", :image =>  "/mycard34.jpg" , :desc => "Kind, energetic but calm woman. Conservative, pragmatic and authoritarian. Fruitful in mind and body." , :rdesc => "Domineering, jealous, dogmatic and irrational. Quick to take offense." },
  { :id => 35, :name => "King of Wands", :image =>  "/mycard35.jpg" , :desc => "Courageous, swift and generous man. Passionate and strong. Paternalistic and proud. May be a country gentleman, generally married. Unexpected heritage; a good marriage." , :rdesc => "Despotic, bigoted, prejudiced, evil-minded." },
  { :id => 36, :name => "Ace of Cups", :image =>  "/mycard36.jpg" , :desc => "Harmony, fertility, happiness, beginning of great love." , :rdesc => "Discord, false love, instability." },
  { :id => 37, :name => "Two of Cups", :image =>  "/mycard37.jpg" , :desc => "Love. Harmony, warm friendship. Close relation with a kindred soul. Good for business and love." , :rdesc => "Opposition. False love. Folly, misunderstanding." },
  { :id => 38, :name => "Three of Cups", :image =>  "/mycard38.jpg" , :desc => "Abundance. Pleasure, hospitality, success. The good things of life." , :rdesc => "Sensuality or food and drink intemperance." },
  { :id => 39, :name => "Four of Cups", :image =>  "/mycard39.jpg" , :desc => "Luxury. Abandonment to desire. New ambition." , :rdesc => "Luxury that does not provide happiness. Dissatisfaction with material success. Turning point in life." },
  { :id => 40, :name => "Five of Cups", :image =>  "/mycard40.jpg" , :desc => "Disappointment. Unexpected misfortune. Partial loss. Friendship or love gone. Inheritance." , :rdesc => "New happiness. Return of an old friend or love. Alliance." },
  { :id => 41, :name => "Six of Cups", :image =>  "/mycard41.jpg" , :desc => "Pleasure. Happiness coming from the past. Nostalgia. Success." , :rdesc => "Uncertainty. Living too much in the past. Worthless associates. Inheritance." },
  { :id => 42, :name => "Seven of Cups", :image =>  "/mycard42.jpg" , :desc => "Debauch. Foolish expectations. Illusory dreams, deceit. Intoxication. Drug addiction." , :rdesc => "New will. Intelligent decision. Short travels." },
  { :id => 43, :name => "Eight of Cups", :image =>  "/mycard43.jpg" , :desc => "Indolence. Instability. Material success abandoned, may be for something higher. Decline in interest. Wandering." , :rdesc => "Joy, happiness. A new love or interest in material things.." },
  { :id => 44, :name => "Nine of Cups", :image =>  "/mycard44.jpg" , :desc => "Happiness. Complete material success and well-being. You will get what you wish." , :rdesc => "Imperfection, deceit. Intemperance. You will not get what you wish." },
  { :id => 45, :name => "Ten of Cups", :image =>  "/mycard45.jpg" , :desc => "Satiety. Perfect love and lasting contentment. Peace, friendship." , :rdesc => "Dissipation, loss of friendship. Betrayal. Waste." },
  { :id => 46, :name => "Page of Cups", :image =>  "/mycard46.jpg" , :desc => "Quiet and studious youth, but also sweet and dreamy. News or proposition." , :rdesc => "A sensual libertine, not harmful but neither helpful. Unpleasant news. Flatterer, selfish." },
  { :id => 47, :name => "Knight of Cups", :image =>  "/mycard47.jpg" , :desc => "A young man may be an artist, who is graceful and poetic. He is an indolent dreamer of sensual pleasures. Can mean a messenger, a proposition or an invitation." , :rdesc => "Lazy and deceitful. A dissolute and merciless person." },
  { :id => 48, :name => "Queen of Cups", :image =>  "/mycard48.jpg" , :desc => "Dreamy, calm, poetic, imaginative, kind yet not willing to take much trouble for another." , :rdesc => "Dishonest and vicious woman, not to be trusted." },
  { :id => 49, :name => "King of Cups", :image =>  "/mycard49.jpg" , :desc => "A man skilled in law or trade and interested in science, art, religion or philosophy. A good friend, liberal, idealistic and creative. Kind and willing to take some responsibility." , :rdesc => "A superficial man, easily enthusiastic, but with little depth of character. Untruthful, ruthless and vicious." },
  { :id => 50, :name => "Ace of Swords", :image =>  "/mycard50.jpg" , :desc => "Conquest. Triumph through trouble. Intense activity. Gestation or parturition." , :rdesc => "Disaster or conquest followed by disaster. Great loss. Violent death. Infertility." },
  { :id => 51, :name => "Two of Swords", :image =>  "/mycard51.jpg" , :desc => "Peace. Balanced forces. Indecision. Strength. Friendship." , :rdesc => "Disloyalty. Change, sometimes in the wrong direction. Quarrel" },
  { :id => 52, :name => "Three of Swords", :image =>  "/mycard52.jpg" , :desc => "Sorrow. Separation, quarrel, tears. Delay. Absence." , :rdesc => "Confusion, loss, error." },
  { :id => 53, :name => "Four of Swords", :image =>  "/mycard53.jpg" , :desc => "Truce. Solitude. Stagnation. Recovering from illness. Exile. Retreat." , :rdesc => "Renewed activity. Surprise. Prudence and economy are advised." },
  { :id => 54, :name => "Five of Swords", :image =>  "/mycard54.jpg" , :desc => "Defeat. Failure. Loss. Powerlessness. Separation. Lies. Death." , :rdesc => "Risk of loss or defeat. Funeral. Weakness." },
  { :id => 55, :name => "Six of Swords", :image =>  "/mycard55.jpg" , :desc => "Science. Journey by water, revelation, study. Intelligent effort. Success after anxiety." , :rdesc => "Stagnation. Unfavorable result. Intellectual pride." },
  { :id => 56, :name => "Seven of Swords", :image =>  "/mycard56.jpg" , :desc => "Futility. Partial or unpredictable result. Dreams, vacillation. Travel by land." , :rdesc => "Quarrels. Slanders. Disenchantment in family or friendship." },
  { :id => 57, :name => "Eight of Swords", :image =>  "/mycard57.jpg" , :desc => "Interference. Restriction. Temporal sickness or captivity. Indecision." , :rdesc => "New beginnings. Freedom from the past bondages." },
  { :id => 58, :name => "Nine of Swords", :image =>  "/mycard58.jpg" , :desc => "Cruelty. Suffering. Misery. Sickness. Martyrdom. Burden. May be death of a loved one." , :rdesc => "Patience, faithfulness, unselfishness." },
  { :id => 59, :name => "Ten of Swords", :image =>  "/mycard59.jpg" , :desc => "Ruin. Total defeat. Death. The end of an illusion." , :rdesc => "Transitory success. Improvement." },
  { :id => 60, :name => "Page of Swords", :image =>  "/mycard60.jpg" , :desc => "Logic and penetrating young man or woman. Mentally and physically dexterous. Spying. Messages." , :rdesc => "Frivolous, revengeful and cunning. Indiscretion. Impotence. Unforeseen perturbation." },
  { :id => 61, :name => "Knight of Swords", :image =>  "/mycard61.jpg" , :desc => "Audacious, clever and gallant; spirited young man. He may be domineering and unstable but he has the better intentions." , :rdesc => "Harsh, fanatic, extravagant. Tyranic and aggressive. Dangerous enemy." },
  { :id => 62, :name => "Queen of Swords", :image =>  "/mycard62.jpg" , :desc => "A graceful but stern woman. She has keen insight and good judgment. May be a dancer, a widow or a childless woman. This card also means privation and mourning." , :rdesc => "Playfully mischievous. Dangerous enemy. Jealous and narrow-minded woman." },
  { :id => 63, :name => "King of Swords", :image =>  "/mycard63.jpg" , :desc => "This man may be a very good ally or counselor. He is clever and self-controlled and has some authority. Also is modern, analytical and very strong. The card may also mean a lawsuit." , :rdesc => "Deceitful and malicious man. He may be a dangerous enemy, violent and powerful." },
  { :id => 64, :name => "Ace of Pentacles", :image =>  "/mycard64.jpg" , :desc => "The beginning of prosperity and wealth. Pleasure and beauty." , :rdesc => "Success is delayed or it does not give happiness. Greed." },
  { :id => 65, :name => "Two of Pentacles", :image =>  "/mycard65.jpg" , :desc => "Change. Alternation of gain and loss. Equilibrium in the midst of change. Ability to adapt to new circumstances. Some complications. Unstable mood." , :rdesc => "Uncertainty. Difficulty adapting to new circumstances." },
  { :id => 66, :name => "Three of Pentacles", :image =>  "/mycard66.jpg" , :desc => "Works. Task well done. Commercial transactions. Professional growth. Dignity. A male child." , :rdesc => "Unsufficient skill or knowledge to achieve the goal. Fruitless work. Lack of seriousness." },
  { :id => 67, :name => "Four of Pentacles", :image =>  "/mycard67.jpg" , :desc => "Power. Purely material gain and security. A gift or an inheritance. A female child. Greed." , :rdesc => "Prejudice. Limitation. Sudden check in progress or loss. Reckeless spending of money." },
  { :id => 68, :name => "Five of Pentacles", :image =>  "/mycard68.jpg" , :desc => "Worry. Loss of money or employment. Poverty. Defeat. Lovers. Sympathy found in the midst of trouble." , :rdesc => "New employment or opportunity. Productive work. Misfortune in love." },
  { :id => 69, :name => "Six of Pentacles", :image =>  "/mycard69.jpg" , :desc => "Success. Material gain and power. Sharing with others the wealth." , :rdesc => "Transitory gains. Prodigality. Bribery. Purse proud." },
  { :id => 70, :name => "Seven of Pentacles", :image =>  "/mycard70.jpg" , :desc => "Failure. Defeat. Loss of money. Hard work but little gain. Greedy." , :rdesc => "Delayed success after hard work. Work done for the love of work without expecting retribution." },
  { :id => 71, :name => "Eight of Pentacles", :image =>  "/mycard71.jpg" , :desc => "Prudence. The first steps of a profitable profession. Learning a business or profession. Ability in material affairs. A brunette." , :rdesc => "Greedy. Selfish in a petty way. Vanity." },
  { :id => 72, :name => "Nine of Pentacles", :image =>  "/mycard72.jpg" , :desc => "Gain. Practical wisdom limited to everyday affairs and the home. Stability. Solitude. Inheritance." , :rdesc => "Loss of friendship or a material thing. Cancelled project. Beware of knavery." },
  { :id => 73, :name => "Ten of Pentacles", :image =>  "/mycard73.jpg" , :desc => "Wealth. Fulfillment of material fortune. Family matters. Inheritance. House." , :rdesc => "Family misfortune. Loss of inheritance. Beware of risky projects." },
  { :id => 74, :name => "Page of Pentacles", :image =>  "/mycard74.jpg" , :desc => "A learned young person, careful and reflective. Good management, kind and benevolent. The bearer of good news and messages." , :rdesc => "Wasteful, illogical, rebellious youth. Bad news or lost of money." },
  { :id => 75, :name => "Knight of Pentacles", :image =>  "/mycard75.jpg" , :desc => "Mature and responsible, a trustworthy and laborious man. A capable manager. An important matter concerning money." , :rdesc => "Dull, lazy or clumsy man. Careless. Stagnation." },
  { :id => 76, :name => "Queen of Pentacles", :image =>  "/mycard76.jpg" , :desc => "Charming and generous woman. Pragmatic and quiet, but ambitious. Opulence, security." , :rdesc => "Foolish and temperamental. Prone to suspicion ad fearful of failure. Negligent." },
  { :id => 77, :name => "King of Pentacles", :image =>  "/mycard77.jpg" , :desc => "A married man, wealthy and clever in money matters. Patient and laborious, he is an experimented chief and a reliable ally." , :rdesc => "Vicious and greedy man. Beware or gamblers or speculators. Easy to bribe, he may be a dangerous man." },
  ]
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_back fallback_location: root_path, notice: 'Card was successfully created.' }
        format.js   {render 'create.js.erb'}
        b = Setting.find(1)  
        c = b.setting04.to_i + 1
        d = b.setting05.to_i + 1
        e = Setting.find(2).setting04 
        if c >= d
          b.setting04 = e
        elsif
          b.setting04 = c.to_s
        end
        b.save
        #format.html { redirect_to @card, notice: 'Card was successfully created.' }
        #format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :price, :diff, :date, :card01, :card02, :card03, :card04, :card05, :card06, :card07, :card08, :card09, :card10, :card11, :card12, :person_id)
    end
end
