#let Contracts_Discharge = [
  == 4 Ways to Discharge Contracts
  Contracts are *discharged* when they end - no parties have any further obligations, and notably no party can sue each other anymore. 

  === Discharge by Performance
  This is the good ending. Both parties finish performing their obligations (including all implied terms) satisfactorily and the contract is discharged. Yay!

  Some contractual terms can survive the completion of a contract, like indemnification provisions, limitation of liability clauses, NDAs, customer privacy, and non-competes. These terms can be extended even after discharge through *survival clauses*.
  
  The notion of *tender of performance* also exists - this is when 1 party attempts to perform. One party may attempt (tend) performance, but the other party refuses to accept it. In this case, the one tending can sue for contract breach. Debtors who tend payment but are unsuccessful are free from liability on interest; but if the payment is refused, the debt isn't extinguished. The legal principle is that the onus is on the debtor to find and pay their creditor.

  === Discharge by Agreement 
  This occurs when both parties agree to stop the contract and not perform, in one of a few ways.

  ==== Waiver
  A *waiver* is an agreement not to proceed with the performance of an existing contract, and is also a contract, requiring the 7 elements and so on. As a waiver is a contract, both parties need consideration - thus this can only occur when *neither party has fully performed*. A waiver must be agreed to - you cannot impose a waiver on the other party and proceed to not perform.

  ==== Substituted Agreements
  This occurs when the parties substitute their old agreement with a new one, where the burden to one party is lessened:
  #block(inset:(left:1em))[
    - *Material Alteration*: One party may offer money or some other substitute for performance, creating a new arrangement. The discharge of the previous contract is incidental.
    - *Accord and Satisfaction*: Similar to Material Alteration but the parties seek to end their existing arrangement and the new arrangement is a means to this end. It is usually seen in out-of-court settlements with some sum of money exchanged.
    - *Novation* - The parties agree to terminate the previous contract and replace it with a new one, with either a material change in terms or a change in parties. 
  ]

  ==== Contracts that Provide for its Own Dissolution
  #block(inset:(left:1em))[
    - *Condition Precedents*: These clauses stipulate that a given uncertain event must occur before the obligation to perform arises (ex. insurance). It can be written in the contract or an oral understanding. The parties are discharged only when the condition precedent becomes impossible to fulfill.
    - *Condition Subsequent*: These clauses are the reverse of a condition precedent - these bring a promisor's liability to an end if an uncertain event happens. The termination of liability is a discharge by agreement.
    - *Option to Terminate*: These clauses allow a contract to be terminated on condition that the party provides notice to the other party. (ex. employment contracts often give the right to terminate).
  ]
  === Discharge by Operations of Law
  ==== The Bankruptcy and Insolvency Act
  Bankrupt debtors are discharged from all contractual liabilities after the bankruptcy process finishes, but only if they qualify for a certificate stating that the bankruptcy was due to misfortune and not misconduct.

  ==== Provincial-level Limitations Acts
  Debts that are ignored by a creditor for a long time become *statute barred* - the creditor loses the right to sue as the suit was delayed beyond the limitation period in the relevant statute. This bars a right of action, but does not fully discharge it - the claim can be rehabilitated and made enforceable through certain conduct of the promisor...? The textbook was not fully clear on this. 
  
  === Discharge by Frustration
  One party can be discharged for failure to perform if external causes have made performance impossible, pointless, or radically different from what was contemplated by the parties - essentially unpredictable events changing the context enough that performance is impossible or frivolous.
  
  ==== History of Frustration
  Back in ye olden days, the terms of a contract were absolute - even if it were impossible to perform! This led to many hardships, especially for renters, who were required to keep the property in good repair, making them liable for fire damage, war, etc. One particular case where this happened, _Paradine v. Jane_ dates back to 1647!

  The courts have now begun to recognize how external actions can cause radically different situations, such as in _Taylor v Caldwell_, which seems to be one of the first cases forming the doctrine of frustration. Paraphrased, they state that "where a contract requires the existence of a person or thing becomes impossible to perform since it ceases to exist, the contract ends."
  
  ==== Requirements for Frustration
  #block(inset:(left:1em))[
    1. The Frustrating event must have been *unforeseen* when the contract was created
    2. The Frustrating event must have been *outside the control of both parties*
    3. The Frustrating event must have occurred *after* the contract was made
    4. The Frustrating event makes performance *impossible, purposeless, or "radically different"* from what was originally intended by the parties
  ]
  Note: Impossibility and Purposeless are confusable. According to Wikipedia, "the distinction is that impossibility concerns the *duties* specified in the contract, but frustration of purpose concerns the *reason a party entered* into the contract".
  
  ==== Other Caveats to Frustration
  ===== Self-Induced Frustration is Not a Frustrating Event
  *Self-Induced Frustration* is where one party wilfully disables itself from performing a contract, claiming that the contract has been frustrated. Clearly shooting yourself in the foot is not a frustrating event. It is Breach of Contract. Don't footgun yourself.
  
  ===== It must be IMPOSSIBLE
  It is not enough if circumstances change and performance will be more challenging than originally thought - it must be physically impossible to perform the duties outlined in the contract.
  
  ==== The Effect of Frustration
  When a contract is frustrated, it is *discharged at the moment of the frustrating event*. The courts enforce the contract up to the moment of discharge and *let the loss fall where it lies* - obligations due before the frustrating event remain, and any obligations arising after the event are discharged. 

  This obviously can have some consequences. If neither party has performed, frustration completely discharges both parties cleanly. However, if either side partially performs, one party could receive a windfall for the completed performance of another party - for example, if they were to be paid after the frustrating event. This is quite unfair and harsh at times. 

  ==== Fixing Unfairness in Frustration
  ===== The Frustrated Contracts Act
  This act fixes some of the unfairness in allocating losses. 
  #block(inset:(left:1em))[
    - For either party, any amount [due/paid] may be [retained/recovered], but no more than the amount [paid/due].
    - Save for in BC, Yukon, or SK, if one party performs, yet no money was paid or due, and the other party hasn't received any benefit, the *performing party bears the loss*. Some extra splitting of loss occurs in those 3 jurisdictions.
    - For example, say I am to perform work for Prof. Masterman, and our contract gets frustrated. If I had previously collected a deposit from him, I am entitled to an amount corresponding to the cost of my work. If, however, I had not collected any deposit, the 2nd point applies and I bear the loss.
  ]
  ===== The Sale of Goods Act
  Under Section 8, Where:
  #block(inset:(left: 1em))[
    - There is an agreement to sell *specific goods* (they must be identified & agreed on at the time of sale)
    - The risk has *not been transferred to the buyer* (the seller is still responsible for goods safety)
    - The goods have *perished* without any fault from the buyer or seller (this is the frustrating event)
  ]
  Then the agreement is avoided, or equivalently frustrated.
]

#let Contracts_Breach = [
  == Breach of Contract: The 5th Way
  The last way for a contract to end is if one of the 2 parties screws up. This allows you to sue\*.

  === Conditions and Warranties - Major and Minor Breaches
  Some breaches of contract do not immediately discharge a contract. We need to separate the different types of terms in a contract. A *condition* is an essential term to the contract, while a *warranty* is a non-essential term.

  *Major Breaches* are breaches of the whole contract or an essential term (condition), so that the purpose of the entire contract is defeated. If this happens, the non-breaching party can either discharge the contract (freeing them from liability), then sue for damages; or continue on despite the breach, remaining "ready willing and able to perform", forcing the other side to perform as well. If the latter happens, the non-breaching party is still liable to perform its side of the contract.

  *Minor Breaches* are breaches of non-essential terms of the contract, or breaching an essential term of the contract in a minor way. If this happens, both parties are still bound to the contract, however, the non-breaching party can sue for damages where it has incurred losses due to the breach.

  In summary, major breaches may discharge the non-breaching party from performing the contract, but not always. They get to choose whether to discharge or continue. Minor breaches do not discharge.

  === Ways to Breach Your Contract
  ==== Express Repudiation
  *Express Repudiation* occurs when 1 party declares to the other that it does not intend to perform as promised, for whatever reason. The promisee can either:
  #block(inset:(left: 1em))[
  - Terminate the contract immediately, reserving the right to sue for damages.
  - Continue to insist on performance and wait for the eventual non-performance (all the while remaining ready and willing to perform). They can still sue if they don't perform by stated time.
  ]
  
  *Anticipatory Breaches* are express repudiations that occur *before the time agreed for performance*. In this case, the non-breaching party either accepts it or insists on performance.

  Also note that this breach can only occur after the contract has been formed, which the slides mention.

  ==== Rendering Performance Impossible
  This is self-induced frustration that was mentioned earlier. This can occur either *before* or *when* performance is due.

  ==== Failing to Perform
  Failure to perform can only occur at the time of performance - otherwise, the infringing party can always choose to perform later and still meet their obligations under the contract. Failure to perform also only usually becomes apparent at the time set for performance.
  
  The degree of failure also varies - it could be a partial failure, total failure, or simply grossly inadequate performance. The extent of a failure impacts the types of remedies available to the injured party.

  === The Doctrine of Substantial Performance
  This is not to be confused with "Part Performance", which only applies to contracts for land and in cases where the Statute of Fraud applies.

  *Substantial Performance* is performance that does not comply with the contract's requirements in some minor way. If this happens, the non-breaching party *cannot avoid performance* under the contract (i.e. cannot discharge the contract). They have to perform, but can sue for damages from the inadequate performance. Essentially, trivial performance failures cannot allow obligation avoidance.

  === Exemption Clauses
  As mentioned before, *exemption clauses* exempt a party from liability for failing to perform some or all of its contractual obligations. These are helpful in business to keep legal costs low. Costs are further reduced as contracts can require one party to obtain insurance, for instance in shipping contracts - then the risk assumed as part of an exemption clause gets covered by said insurance.
  
  However, in Standard Form Contracts, the inequality of bargaining power can put risks onto parties who are unwilling or unable to accept the risk. How can they escape the effects of an exemption clause?

  ==== The Ways the Slides have
  As mentioned before, the defences of *Inadequate Notice*, *Contra Proferendum*, *Misrepresentation* and *Non-Est Factum* can help make these clauses not enforecable.

  ==== The Way the Textbook has
  A 3 step approach where:
  #block(inset:(left:1em))[
    1. The Court decides whether the clause covers the circumstances in question - an interpretation question, notes to ambiguity, and Contra Proferendum.
    2. The Court decides if the clause is an *unconscionable term* - if it is unfair and gives one party an unfair advantage. These terms have inequality in the process of creating the clause, and also an unfair outcome.
    3. Any Public Policy and Public Interest considerations. Is there greater harm to the public interest if the offending conduct is protected?
]
]