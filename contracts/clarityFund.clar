; ClarityFund: Decentralized Crowdfunding for Space Exploration

;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Constants ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_NOT_FOUND (err u101))
(define-constant ERR_ALREADY_EXISTS (err u102))
(define-constant ERR_INSUFFICIENT_FUNDS (err u103))
(define-constant ERR_DEADLINE_PASSED (err u104))
(define-constant ERR_GOAL_NOT_REACHED (err u105))
(define-constant ERR_INVALID_INPUT (err u106))
(define-constant ERR_CONTRIBUTIONS_EXIST (err u107))
(define-constant ERR_EXTENSION_NOT_ALLOWED (err u108))
(define-constant ERR_VOTING_PERIOD_NOT_ENDED (err u109))
(define-constant ERR_VOTING_THRESHOLD_NOT_MET (err u110))


;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Constants ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
(define-constant EXTENSION_THRESHOLD u75) ;; 75% of the goal
(define-constant MAX_EXTENSION_DAYS u30)
(define-constant VOTING_PERIOD_DAYS u7)
(define-constant MIN_VOTE_THRESHOLD_PERCENT u60) ;; 60% of votes must be in favor
(define-constant MIN_VOTE_COUNT_THRESHOLD u10) ;; At least 10 votes required


;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Maps ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
(define-map projects 
  { project-id: uint } 
  { 
    name: (string-ascii 50), 
    creator: principal, 
    goal: uint, 
    deadline: uint, 
    total-raised: uint, 
    is-active: bool,
    extensions-used: uint,
    vote-end-time: uint,
    total-votes: uint,
    votes-in-favor: uint
  }
)

;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;    Maps   ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
(define-map contributions 
  { project-id: uint, contributor: principal } 
  { amount: uint }

(define-map votes
  { project-id: uint, voter: principal }
  { in-favor: bool }
)

;; data maps
;;
;; Variables
(define-data-var project-nonce uint u0)

;; public functions
;;
;; Helper function to check if a project exists
(define-private (project-exists (project-id uint))
  (is-some (map-get? projects { project-id: project-id }))
)

;; read only functions
;;
;; Helper function to calculate voting percentage
(define-private (calculate-vote-percentage (votes-in-favor uint) (total-votes uint))
  (if (is-eq total-votes u0)
    u0
    (/ (* votes-in-favor u100) total-votes)
  )
)
